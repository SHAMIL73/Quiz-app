import 'package:flutter/material.dart';
import 'package:flutter_application_1/ProviderDemo.dart';
import 'package:flutter_application_1/Resultpage.dart';
import 'package:flutter_application_1/List.dart';
import 'package:provider/provider.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
 void goToNextQuestion() {
    if (Provider.of<ProviderDemo>(context).index < QuestionsF.length - 1) {
      Provider.of<ProviderDemo>(context, listen: false).iN(context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Resultpage(
                  mark: Provider.of<ProviderDemo>(context).mark,
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
                    child: Provider.of<ProviderDemo>(context).text1(),
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
                            text: "${QuestionsF[Provider.of<ProviderDemo>(context).index].number}",
                            style: const TextStyle(fontSize: 55, color: Colors.green),
                          ),
                          TextSpan(
                            text: "${QuestionsF[Provider.of<ProviderDemo>(context).index].question}",
                            style: const TextStyle(
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
              const SizedBox(
                height: 55,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        child: SizedBox(
                         width : MediaQuery.of(context).size.width,
                            height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                   MaterialStateProperty.all(Provider.of<ProviderDemo>(context).containerColorA),
                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                 ),),
                            ),
                            onPressed: () {
                          Provider.of<ProviderDemo>(context, listen: false).colorFunctionA();
                          Future.delayed(const Duration(milliseconds: 250), () {
                            Provider.of<ProviderDemo>(context, listen: false).aA(context);
                          });
                        },
                            child: Text(
                              QuestionsF[Provider.of<ProviderDemo>(context).index].options![0],
                              style:
                                  const TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: SizedBox(
                           width : MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                   MaterialStateProperty.all(Provider.of<ProviderDemo>(context).containerColorB),
                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                 ),),
                            ),
                             onPressed: () {
                          Provider.of<ProviderDemo>(context, listen: false).colorFunctionB();
                          Future.delayed(const Duration(milliseconds: 250), () {
                            Provider.of<ProviderDemo>(context, listen: false).bB(context);
                          });
                        },
                          child: Text(
                          QuestionsF[Provider.of<ProviderDemo>(context).index].options![1],
                          style: const TextStyle(fontSize: 30, color: Colors.black),
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
                       width : MediaQuery.of(context).size.width,
                      height: 50,
                      
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                               MaterialStateProperty.all(Provider.of<ProviderDemo>(context).containerColorC),
                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                 ),),
                        ),
                         onPressed: () {
                          Provider.of<ProviderDemo>(context, listen: false).colorFunctionC();
                          Future.delayed(const Duration(milliseconds: 250), () {
                            Provider.of<ProviderDemo>(context, listen: false).cC(context);
                          });
                        },
                        child: Text(
                          QuestionsF[Provider.of<ProviderDemo>(context).index].options![2],
                          style: const TextStyle(fontSize: 30, color: Colors.black),
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
                       width : MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                               MaterialStateProperty.all(Provider.of<ProviderDemo>(context).containerColorD),
                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                 ),),
                        ),
                         onPressed: () {
                          Provider.of<ProviderDemo>(context, listen: false).colorFunctionD();
                          Future.delayed(const Duration(milliseconds: 250), () {
                            Provider.of<ProviderDemo>(context, listen: false).dD(context);
                          });
                        },
                        child: Text(
                          QuestionsF[Provider.of<ProviderDemo>(context).index].options![3],
                          style: const TextStyle(fontSize: 30, color: Colors.black),
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