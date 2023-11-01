import 'package:flutter/material.dart';

class ProviderDemo with ChangeNotifier {
  Text text1() {
    return const Text(
      "MR.QUIZ",
      style: TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
