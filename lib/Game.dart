import 'package:flutter/material.dart';
import 'Resultpage.dart';
import 'package:flutter_application_1/List.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int index = 0; // Initialize index to 0
  var mark = 0;
  Color containerColorA = Colors.white;
  Color containerColorB = Colors.white;
  Color containerColorC = Colors.white;
  Color containerColorD = Colors.white;
  // Function to handle button press and navigate to the next question
  void goToNextQuestion() {
    if (index < QuestionsG.length - 1) {
      // Check if there are more QuestionsG
      setState(() {
        index++; // Increment the index
      });
    } else {
      // If there are no more QuestionsG, navigate to the result page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Resultpage(
                  mark: mark,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 14, 3, 169),
                Color.fromRGBO(0, 0, 0, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 39),
                    child: Text(
                      "MR.QUIZ",
                      style: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${QuestionsG[index].number}",
                            style: TextStyle(fontSize: 55, color: Colors.green),
                          ),
                          TextSpan(
                            text: "${QuestionsG[index].question}",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        child: SizedBox(
                         width: 356,
                          height: 56,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(containerColorA),
                            ),
                            onPressed: () {
                              setState(() {
                                if (QuestionsG[index].indexofAnswer == 0) {
                                  mark++;
                                  containerColorA = Colors.green;
                                } else {
                                  containerColorA = Colors.red;
                                }
                              });
                              Future.delayed(Duration(milliseconds: 250), () {
                                setState(() {
                                  if (index != 4) {
                                    index++;
                                  } else {
                                    goToNextQuestion();
                                  }
                                  containerColorA = Colors.white;
                                });
                              });
                            },
                            child: Text(
                              "${QuestionsG[index].options![0]}",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: SizedBox(
                         width: 356,
                          height: 56,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(containerColorB),
                            ),
                            onPressed: () {
                              setState(() {
                                if (QuestionsG[index].indexofAnswer == 1) {
                                  mark++;
                                  containerColorB = Colors.green;
                                } else {
                                  containerColorB = Colors.red;
                                }
                              });
                              Future.delayed(Duration(milliseconds: 250), () {
                                setState(() {
                                  if (index != 4) {
                                    index++;
                                  } else {
                                    goToNextQuestion();
                                  }
                                  containerColorB = Colors.white;
                                });
                              });
                            },
                            child: Text(
                              "${QuestionsG[index].options![1]}",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: SizedBox(
                    width: 356,
                          height: 56,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(containerColorC),
                        ),
                        onPressed: () {
                          setState(() {
                            if (QuestionsG[index].indexofAnswer == 2) {
                              mark++;
                              containerColorC = Colors.green;
                            } else {
                              containerColorC = Colors.red;
                            }
                          });
                          Future.delayed(Duration(milliseconds: 250), () {
                            setState(() {
                              if (index != 4) {
                                index++;
                              } else {
                                goToNextQuestion();
                              }
                              containerColorC = Colors.white;
                            });
                          });
                        },
                        child: Text(
                          "${QuestionsG[index].options![2]}",
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: SizedBox(
                      width: 356,
                          height: 56,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(containerColorD),
                        ),
                        onPressed: () {
                          setState(() {
                            if (QuestionsG[index].indexofAnswer == 3) {
                              mark++;
                              containerColorD = Colors.green;
                            } else {
                              containerColorD = Colors.red;
                            }
                          });
                          Future.delayed(Duration(milliseconds: 250), () {
                            setState(() {
                              if (index != 4) {
                                index++;
                              } else {
                                goToNextQuestion();
                              }
                              containerColorD = Colors.white;
                            });
                          });
                        },
                        child: Text(
                          "${QuestionsG[index].options![3]}",
                          style: TextStyle(fontSize: 30, color: Colors.black),
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
    );
  }
}
