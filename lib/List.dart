import 'package:flutter_application_1/QuizVariables.dart';

List<QuizVariables> QuestionsM = [
  QuizVariables(
      number: "Q:1) ",
      question: "1+1=__",
      options: ["A : 4", "B : 2", "C : 3", "D : 1"],
      indexofAnswer: 1),
  QuizVariables(
      number: "Q:2) ",
      question: "1-1=__",
      options: ["A : 0", "B : 1", "C : 3", "D : 6"],
      indexofAnswer: 0),
  QuizVariables(
      number: "Q:3) ",
      question: "1-3=__",
      options: ["A : 2", "B : -1", "C : -2", "D : 5"],
      indexofAnswer: 2),
  QuizVariables(
      number: "Q:4) ",
      question: "2x3=__",
      options: ["A : 5", "B : 3", "C : 6", "D : 7"],
      indexofAnswer: 2),
  QuizVariables(
      number: "Q:5) ",
      question: "10/2=__",
      options: ["A : 2", "B : 5", "C : 10", "D : 0"],
      indexofAnswer: 1),
];

List<QuizVariables> QuestionsS = [
  QuizVariables(
      number: "Q1: ",
      question: "2020 Super Bowl winner?",
      options: ["A: Kansas City Chiefs", "B: San Francisco 49ers", "C: New England Patriots", "D: Los Angeles Rams"],
      indexofAnswer: 0),
  QuizVariables(
      number: "Q2: ",
      question: "2016 Summer Olympics host?",
      options: ["A: USA", "B: Brazil", "C: France", "D: China"],
      indexofAnswer: 1),
  QuizVariables(
      number: "Q3: ",
      question: "Wimbledon Championships sport?",
      options: ["A: Tennis", "B: Golf", "C: Soccer", "D: Basketball"],
      indexofAnswer: 0),
  QuizVariables(
      number: "Q4: ",
      question: "Annual Masters Tournament city?",
      options: ["A: New York", "B: London", "C: Augusta", "D: Paris"],
      indexofAnswer: 2),
  QuizVariables(
      number: "Q5: ",
      question: "NBA's all-time top scorer?",
      options: ["A: LeBron James", "B: Jithin", "C: Kobe Bryant", "D: Michael Jordan"],
      indexofAnswer: 0),
];

List<QuizVariables> QuestionsF = [
  QuizVariables(
    number: "Q1: ",
    question: "Pizza topping?",
    options: ["A: Pepperoni", "B: Mushroom", "C: Pineapple", "D: Sausage"],
    indexofAnswer: 0,
  ),
  QuizVariables(
    number: "Q2: ",
    question: "Margarita ingredient?",
    options: ["A: Tequila", "B: Vodka", "C: Rum", "D: Gin"],
    indexofAnswer: 0,
  ),
  QuizVariables(
    number: "Q3: ",
    question: "Sushi type?",
    options: ["A: Japanese", "B: Chinese", "C: Italian", "D: Mexican"],
    indexofAnswer: 0,
  ),
  QuizVariables(
    number: "Q4: ",
    question: "Brownie ingredient?",
    options: ["A: Chocolate", "B: Peanut", "C: Caramel", "D: Coconut"],
    indexofAnswer: 0,
  ),
  QuizVariables(
    number: "Q5: ",
    question: "Cappuccino ingredients?",
    options: ["A: Espresso", "B: Hot Choco", "C: Lemonade", "D: Orange"],
    indexofAnswer: 0,
  ),
];
List<QuizVariables> QuestionsG = [
  QuizVariables(
    number: "Q1: ",
    question: "Best gaming console?",
    options: ["A: PlayStation", "B: Xbox", "C: Nintendo Switch", "D: PC"],
    indexofAnswer: 0,
  ),
  QuizVariables(
    number: "Q2: ",
    question: "Popular gaming franchise?",
    options: ["A: Mario", "B: Halo", "C: Pubg", "D: Call of Duty"],
    indexofAnswer: 0,
  ),
  QuizVariables(
    number: "Q3: ",
    question: "Favorite gaming genre?",
    options: ["A: RPG", "B: FPS", "C: Platformer", "D: Strategy"],
    indexofAnswer: 0,
  ),
  QuizVariables(
    number: "Q4: ",
    question: "Character from a famous video game?",
    options: ["A: Mario", "B: Master Chief", "C: Link", "D: Geralt of Rivia"],
    indexofAnswer: 0,
  ),
  QuizVariables(
    number: "Q5: ",
    question: "Best-selling video game of all time?",
    options: ["A: Minecraft", "B: GTA V", "C: Tetris", "D: Pubg"],
    indexofAnswer: 0,
  ),
];

List<int> savedMarks = [];