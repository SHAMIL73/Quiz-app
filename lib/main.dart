import 'package:flutter/material.dart';
import 'package:flutter_application_1/ProviderDemo.dart';
import 'package:flutter_application_1/SplashScreen.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (context) => ProviderDemo(),
      child: const MaterialApp(
        title: "QuizApp",
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}