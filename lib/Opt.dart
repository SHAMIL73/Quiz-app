import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/ProviderDemo.dart';
import 'package:flutter_application_1/VerifyOtp.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}


class _OtpState extends State<Otp> {

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

  

  bool isValidPhoneNumber(String value) {
    // Simple validation to check if the entered value is a valid phone number
    return value.startsWith('+') && value.length > 10;
  }

bool otpFieldVisibility = false;
 var receivedID = '';
final auth = FirebaseAuth.instance;

  void verifyUserPhoneNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: Provider.of<ProviderDemo>(context, listen: false).otpController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (value) => print('Logged In Successfully'),
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;
        otpFieldVisibility = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('TimeOut');
        print('Verifying phone number: +${Provider.of<ProviderDemo>(context, listen: false).otpController.text}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
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
                  'Sign in with Number',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30.0),
                TextField(
                  controller: Provider.of<ProviderDemo>(context, listen: false).otpController,
                  style: const TextStyle(color: Colors.black),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Enter your number with country code',
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    if (otpFieldVisibility) {
                      verifyUserPhoneNumber();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerifyOtp()),
                    );
                    }else{
                      verifyUserPhoneNumber();
                    }
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(170, 44)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: Center(
                    child: const Text('SENT OTP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
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
                              builder: (context) => Dashboard(),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 223, 227, 216),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/google-removebg-preview.png',
                            height: 35,
                            width: 35,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 223, 227, 216),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/gmail.png',
                            height: 42,
                            width: 42,
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