import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('MR.QUIZ'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Login to Mr. Quiz',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(margin: EdgeInsets.only(left: 64),
                        child: ElevatedButton(
                          onPressed: () async {
                            final userCredential =
                                await _auth.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            if (userCredential != null) {
                              // Successful sign-in
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Dashboard(),
                                ),
                              );
                            } else {
                              // Error during sign-in
                              // ...
                            }
                          },
                          child: const Text('SIGN UP', style: TextStyle(fontSize: 20)),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                          ),
                        ),
                      ),
                      TextButton(
                    onPressed: () {
                    },
                    child: Text("sign in",style: TextStyle(),),
                  ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("or sign in with"),
                ),
                TextButton(
                  onPressed: () async {
                    // Sign in with Google
                    final UserCredential? userCredential =
                        await signInWithGoogle();
                    if (userCredential != null) {
                      // Successful sign-in
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ),
                      );
                    } else {
                      // Error during sign-in
                      // ...
                    }
                  },
                  child: Image.asset('assets/images/google.png',
                      height: 42, width: 42),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}