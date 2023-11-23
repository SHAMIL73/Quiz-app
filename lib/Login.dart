import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:flutter_application_1/Opt.dart';
import 'package:flutter_application_1/Signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('MR.QUIZ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 71),
                      child: ElevatedButton(
                        onPressed: () async {
                          final userCredential =
                              await auth.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          // ignore: unnecessary_null_comparison
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
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          fixedSize:
                              MaterialStateProperty.all(const Size(170, 44)),
                        ),
                        child: const Text('LOG IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        );
                      },
                      child: const Text("sign up",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                      "-------------------------or sign in with-------------------------"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
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
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 223, 227, 216),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/google-removebg-preview.png',
                            height: 35, // Set the desired height of the image
                            width: 35, // Set the desired width of the image
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Otp(),
                          ),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 223, 227, 216),
                        ),
                        child: const Center(
                          child: Text(
                            "OTP",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18, // Adjust the size as needed
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
        ),
      ),
    );
  }
}
