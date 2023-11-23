import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/ProviderDemo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});
  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController VerifyOtpController = TextEditingController();
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

  var receivedID = '';
  String enteredOTP = '';
  bool otpFieldVisibility = false;

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

  void verifyOTPCode(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: receivedID, smsCode: enteredOTP);
    await auth
        .signInWithCredential(credential)
        .then((value) => print('User Login In Successful'));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
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
                  'Verify Otp',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30.0),
                TextField(
                  controller: VerifyOtpController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: 'Enter your otp',
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (otpFieldVisibility = true) {
                          verifyOTPCode(context);
                        }else{
                          Provider.of<ProviderDemo>(context, listen: false).verifyUserPhoneNumber();
                        }
                      },
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(170, 44)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: const Center(
                        child: Text('VERIFY OTP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
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
                        decoration: const BoxDecoration(
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