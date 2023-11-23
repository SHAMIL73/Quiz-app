import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;


  void logout(BuildContext context) async {
  await _auth.signOut();
  await _googleSignIn.signOut();
  print('signed out');
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const Login()),
    (route) => false,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(
            onPressed: () {
              logout(context);
            },
            child: const Text('Logout'),
          ),],
        ),
      ),
    );
  }
}