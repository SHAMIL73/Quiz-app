import 'package:flutter/material.dart';
import 'package:flutter_application_1/List.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarkHistory extends StatefulWidget {
  const MarkHistory({Key? key}) : super(key: key);

  @override
  State<MarkHistory> createState() => _MarkHistoryState();
}

class _MarkHistoryState extends State<MarkHistory> {


  // Capture the current time once
  final now = DateTime.now();
  final formattedDate = "${DateTime.now().toLocal()}".split(' ')[0];
  final formattedTime = "${DateTime.now().toLocal()}".split(' ')[1].split(':').take(2).join(':');

  @override
  void initState() {
    super.initState();
    getUserScoresMaths();
  }

  // loadmark() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final int? loadedMark = prefs.getInt('markkey');
  //   //await prefs.clear();
  //   setState(() {
  //     mark = loadedMark ?? 0;
  //   });
  // }
  Future<void> getUserScoresMaths() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedMarksString = prefs.getString('user_scores_sports');

    // await prefs.clear();
    if (savedMarksString != null) {
      setState(() {
        savedMarks = savedMarksString
          .split(',')
          .map((s) => int.tryParse(s) ?? 0)
          .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 75, 122),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 171, 173, 198)),
          child: ListView.builder(
            itemCount: savedMarks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Center(
                  child: Column(
                    children: [
                      Text(
                        'Mark: ${savedMarks[index]}',
                        style: const TextStyle(fontSize: 17),
                      ),
                      Text(
                        'Date: $formattedDate',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Time: $formattedTime',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
