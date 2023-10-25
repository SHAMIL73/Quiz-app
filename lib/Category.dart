import 'package:flutter/material.dart';
import 'package:flutter_application_1/Math.dart';
import 'package:flutter_application_1/Sports.dart';
import 'package:flutter_application_1/Food.dart';
import 'package:flutter_application_1/game.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
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
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 39),
                child: Text(
                  "MR.QUIZ",
                  style: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Math()),
                              );
                            },
                            child: Icon(Icons.calculate,
                                color: Color.fromARGB(255, 169, 171, 170),
                                size: 180),
                          ),
                          Text(
                            'Math',
                            style: TextStyle(
                              fontSize: 26,fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sports()),
                              );
                            },
                            child: Icon(Icons.sports_basketball,
                                color: Colors.blue, size: 180),
                          ),
                          Text(
                            'Sports',
                            style: TextStyle(
                              fontSize: 26,fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Food()),
                              );
                            },
                            child: Icon(Icons.food_bank, color: Colors.green, size: 180),
                          ),
                          Text(
                            'Food and drink',
                            style: TextStyle(
                              fontSize: 26,fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Game()),
                              );
                            },
                            child: Icon(Icons.videogame_asset,
                                color: Colors.red, size: 180),
                          ),
                          Text(
                            'Video games',
                            style: TextStyle(
                              fontSize: 26,fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
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
