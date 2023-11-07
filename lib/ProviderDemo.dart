import 'package:flutter/material.dart';
import 'package:flutter_application_1/List.dart';
import 'package:flutter_application_1/Resultpage.dart';

class ProviderDemo with ChangeNotifier {
  int index = 0;
  int mark = 0;
  Color containerColorA = Colors.white;
  Color containerColorB = Colors.white;
  Color containerColorC = Colors.white;
  Color containerColorD = Colors.white;


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

  void colorFunctionA() {
    if (QuestionsF[index].indexofAnswer == 0) {
      mark++;
      containerColorA = Colors.green;
    } else {
      containerColorA = Colors.red;
    }
    notifyListeners();
  }

  void colorFunctionB() {
    if (QuestionsF[index].indexofAnswer == 1) {
      mark++;
      containerColorB = Colors.green;
    } else {
      containerColorB = Colors.red;
    }
    notifyListeners();
  }

 void colorFunctionC() {
    if (QuestionsF[index].indexofAnswer == 2) {
      mark++;
      containerColorC = Colors.green;
    } else {
      containerColorC = Colors.red; 
    }
    notifyListeners();
  }

  void colorFunctionD() {
    if (QuestionsF[index].indexofAnswer == 3) {
      mark++;
      containerColorD = Colors.green;  // it should be containerColorD here, not containerColorB
    } else {
      containerColorD = Colors.red; // also here, it should be containerColorD
    }
    notifyListeners();
  }

  void aA(BuildContext context) {
    if (index != 4) {
      index++;
      containerColorA = Colors.white;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Resultpage(
                  mark: mark,
                )),
      );
      containerColorA = Colors.white;
  }
  notifyListeners();
}

  void bB(BuildContext context) {
    if (index != 4) {
      index++;
      containerColorB = Colors.white;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Resultpage(
                  mark: mark,
                )),
      );
    containerColorB = Colors.white;
    
  }
  notifyListeners();
}

  void cC(BuildContext context) {
    if (index != 4) {
      index++;
      containerColorC = Colors.white;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Resultpage(
                  mark: mark,
                )),
      );
    containerColorC = Colors.white;
   
  }notifyListeners();
}

  void dD(BuildContext context) {
    if (index != 4) {
      index++;
      containerColorD = Colors.white;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Resultpage(
                  mark: mark,
                )),
      );
    containerColorD = Colors.white;
  
  }notifyListeners();
}

void iN(BuildContext context) {
    index++;
    
  }@override
  notifyListeners();
  }