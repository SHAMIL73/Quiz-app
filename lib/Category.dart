import 'package:flutter/material.dart';
import 'package:flutter_application_1/Food.dart';
import 'package:flutter_application_1/Math.dart';
import 'package:flutter_application_1/ProviderDemo.dart';
import 'package:flutter_application_1/Sports.dart';
import 'package:flutter_application_1/game.dart';
import 'package:provider/provider.dart';

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
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 39),
                child: Provider.of<ProviderDemo>(context).text1(),
              ),
              const SizedBox(
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
                                    builder: (context) => const Math()),
                              );
                            },
                            child: const Icon(Icons.calculate,
                                color: Color.fromARGB(255, 169, 171, 170),
                                size: 150),
                          ),
                          const Text(
                            'Math',
                            style: TextStyle(
                              fontSize: 23,fontWeight: FontWeight.w500,
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
                                    builder: (context) => const sports()),
                              );
                            },
                            child: const Icon(Icons.sports_basketball,
                                color: Colors.blue, size: 150),
                          ),
                          const Text(
                            'Sports',
                            style: TextStyle(
                              fontSize: 23,fontWeight: FontWeight.w500,
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
                                    builder: (context) => const Food()),
                              );
                            },
                            child: const Icon(Icons.food_bank, color: Colors.green, size: 150),
                          ),
                          const Text(
                            'Food and drink',
                            style: TextStyle(
                              fontSize: 23,fontWeight: FontWeight.w500,
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
                                    builder: (context) => const Game()),
                              );
                            },
                            child: const Icon(Icons.videogame_asset,
                                color: Colors.red, size: 150),
                          ),
                          const Text(
                            'Video games',
                            style: TextStyle(
                              fontSize: 23,fontWeight: FontWeight.w500,
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
