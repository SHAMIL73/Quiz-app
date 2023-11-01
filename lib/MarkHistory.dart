import 'package:flutter/material.dart';
import 'package:flutter_application_1/List.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class MarkHistory extends StatefulWidget {
  const MarkHistory({Key? key}) : super(key: key);

  @override
  State<MarkHistory> createState() => _MarkHistoryState();
}

class _MarkHistoryState extends State<MarkHistory> {
  int? mark;
  List<String> storedTimes = [];

  @override
  void initState() {
    super.initState();
    saveTimeAndDate();
  }

  DateTime selectedDate = DateTime.now();
  

  Future<void> saveTimeAndDate() async {
    final now = DateTime.now();
 
    final prefs = await SharedPreferences.getInstance();
    final storedTimes = prefs.getStringList('storedTimes') ?? [];
    storedTimes.add(now.toString());
    await prefs.setStringList('storedTimes', storedTimes);
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
            itemCount: savedMarks.length, // Please define savedMarks or replace it with the appropriate list
            itemBuilder: (context, index) {
              final now = DateTime.now();
              String formattedDate = DateFormat('yyyy-MM-dd').format(now.toLocal());
              String formattedTime = DateFormat('hh:mm').format(now.toLocal());
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