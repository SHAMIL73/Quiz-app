import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:flutter_application_1/List.dart'; // Make sure to import the List.dart file where savedMarks is defined
import 'package:shared_preferences/shared_preferences.dart';

class Resultpage extends StatefulWidget {
  final int mark;

  Resultpage({Key? key, required this.mark}) : super(key: key);

  @override
  _ResultpageState createState() => _ResultpageState(mark: mark);
}

class _ResultpageState extends State<Resultpage> {
  final int mark;
  _ResultpageState({required this.mark});
  Savemark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    finalmark = mark;
    await prefs.setInt('key', finalmark!);
  }
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
      Future.delayed(Duration(milliseconds: 500), () {
        if (mounted && !buttonPressed) {
          // Check if widget is still mounted and button not pressed
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
    return widget.mark >= 3 ? 'YOU WIN' : 'YOU LOST';
  }

  Color get resultColor {
    return widget.mark >= 3 ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    savedMarks.add(mark);
    finalmark = widget.mark;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
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
              duration: Duration(milliseconds: 490),
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
              'You Have Scored ${widget.mark}/5',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),

            // Add another row here
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only (top: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      Savemark();
                      // Set the buttonPressed flag to true to stop blinking
                      setState(() {
                        buttonPressed = true;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 151, 147, 147),
                    ),
                    child: Text(
                      "RETRY",
                      style: TextStyle(fontSize: 40, color: Colors.black),
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
