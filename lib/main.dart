import 'package:flutter/material.dart';
import 'package:flutter_application_1/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QuizApp",
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}