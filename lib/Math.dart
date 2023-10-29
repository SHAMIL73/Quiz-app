import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resultpage.dart';
import 'package:flutter_application_1/List.dart';

class Math extends StatefulWidget {
  const Math({Key? key}) : super(key: key);

  @override
  State<Math> createState() => _MathState();
}

class _MathState extends State<Math> {
  int index = 0; // Initialize index to 0
  var mark = 0;
  Color containerColorA = Colors.white;
  Color containerColorB = Colors.white;
  Color containerColorC = Colors.white;
  Color containerColorD = Colors.white;
  // Function to handle button press and navigate to the next question
  void goToNextQuestion() {
    if (index < QuestionsM.length - 1) {
      // Check if there are more QuestionsM
      setState(() {
        index++; // Increment the index
      });
    } else {
      // If there are no more QuestionsM, navigate to the result page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Resultpage(
                  mark: 0,
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
          decoration: const BoxDecoration(
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
                    margin: const EdgeInsets.only(top: 39),
                    child: const Text(
                      "MR.QUIZ",
                      style: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${QuestionsM[index].number}",
                            style: const TextStyle(fontSize: 55, color: Colors.green),
                          ),
                          TextSpan(
                            text: "${QuestionsM[index].question}",
                            style: const TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: SizedBox(
                          width: 270,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(containerColorA),
                            ),
                            onPressed: () {
                              setState(() {
                                if (QuestionsM[index].indexofAnswer == 0) {
                                  mark++;
                                  containerColorA = Colors.green;
                                } else {
                                  containerColorA = Colors.red;
                                }
                              });
                              Future.delayed(const Duration(milliseconds: 250), () {
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
                              QuestionsM[index].options![0],
                              style:
                                  const TextStyle(fontSize: 40, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: SizedBox(
                          width: 270,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(containerColorB),
                            ),
                            onPressed: () {
                              setState(() {
                                if (QuestionsM[index].indexofAnswer == 1) {
                                  mark++;
                                  containerColorB = Colors.green;
                                } else {
                                  containerColorB = Colors.red;
                                }
                              });
                              Future.delayed(const Duration(milliseconds: 250), () {
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
                              QuestionsM[index].options![1],
                              style:
                                  const TextStyle(fontSize: 40, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
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
                      width: 270,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(containerColorC),
                        ),
                        onPressed: () {
                          setState(() {
                            if (QuestionsM[index].indexofAnswer == 2) {
                              mark++;
                              containerColorC = Colors.green;
                            } else {
                              containerColorC = Colors.red;
                            }
                          });
                          Future.delayed(const Duration(milliseconds: 250), () {
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
                          QuestionsM[index].options![2],
                          style: const TextStyle(fontSize: 40, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: SizedBox(
                      width: 270,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(containerColorD),
                        ),
                        onPressed: () {
                          setState(() {
                            if (QuestionsM[index].indexofAnswer == 3) {
                              mark++;
                              containerColorD = Colors.green;
                            } else {
                              containerColorD = Colors.red;
                            }
                          });
                          Future.delayed(const Duration(milliseconds: 250), () {
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
                          QuestionsM[index].options![3],
                          style: const TextStyle(fontSize: 40, color: Colors.black),
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