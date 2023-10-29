import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:flutter_application_1/List.dart'; // Make sure to import the List.dart file where savedMarks is defined
import 'package:shared_preferences/shared_preferences.dart';

class Resultpage extends StatefulWidget {
  const Resultpage({Key? key, required this.mark}) : super(key: key);
  final int mark;

  @override
  _ResultpageState createState() => _ResultpageState(mark);
}

class _ResultpageState extends State<Resultpage> {
  final int mark;
  _ResultpageState(this.mark);

  int? finalmark;
  bool isBlinking = true;
  bool buttonPressed = false; // Add a flag to track button press

  @override
  void initState() {
    super.initState();
    startBlinking();
  }

  void startBlinking() {
    if (!buttonPressed) {
      // Check if the button has not been pressed
      // Toggle the value of isBlinking every 500 milliseconds (you can adjust the duration)
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && !buttonPressed) {
          // Check if the widget is still mounted and the button is not pressed
          setState(() {
            isBlinking = !isBlinking;
          });
          // Continue the blinking animation
          startBlinking();
        }
      });
    }
  }

  String get resultPhrase {
    return mark >= 3 ? 'YOU WIN' : 'YOU LOST';
  }

  Color get resultColor {
    return mark >= 3 ? Colors.green : Colors.red;
  }

  Savemark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    finalmark = mark;
    await prefs.setInt('key', finalmark!);
  }

  @override
  Widget build(BuildContext context) {
    savedMarks.add(mark);
    finalmark = mark;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 14, 3, 169),
              Color.fromRGBO(0, 0, 0, 1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 490),
              opacity: isBlinking ? 1.0 : 0.0, // Toggle opacity
              child: Text(
                resultPhrase,
                style: TextStyle(
                  fontSize: 40,
                  color: resultColor,
                ),
              ),
            ),
            Text(
              'You Have Scored $mark/5',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),

            // Add another row here
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      Savemark();
                      // Set the buttonPressed flag to true to stop blinking
                      setState(() {
                        buttonPressed = true;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Dashboard()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 151, 147, 147),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const SizedBox(
                      height: 50,
                      width: 200,
                      child: Center(
                        child: Text(
                          "RETRY",
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}