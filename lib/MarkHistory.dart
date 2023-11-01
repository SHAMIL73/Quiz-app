import 'package:flutter/material.dart';
import 'package:flutter_application_1/List.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarkHistory extends StatefulWidget {
  const MarkHistory({Key? key}) : super(key: key);

  @override
  State<MarkHistory> createState() => _MarkHistoryState();
}

class _MarkHistoryState extends State<MarkHistory> {
  int? mark;

  @override
  void initState() {
    super.initState();
    loadmark();
  }

   loadmark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? loadedMark = prefs.getInt('key');
    setState(() {
      mark = loadedMark ??
          0;
    });
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
          decoration: BoxDecoration(color: Color.fromARGB(255, 42, 121, 10)),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: savedMarks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Center(
                  child: Text(
                    '${savedMarks[index]}',
                    style: TextStyle(fontSize: 17),
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