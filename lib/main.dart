import 'package:flutter/material.dart';
import 'package:flutter_application_1/ProviderDemo.dart';
import 'package:flutter_application_1/SplashScreen.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
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