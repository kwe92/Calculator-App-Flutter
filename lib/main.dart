// A Simple Calculator App

import 'package:flutter/material.dart';
import 'package:calculatorapp/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // initalier list

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Faster compile time??
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = '';
  var answer = '';

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '/',
    'x',
    '-',
    '+',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simple Calculator',
          style: TextStyle(), //TODO: Title text styling
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: const TextStyle() //TODO: Text Style
                      ,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(answer),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: buttons.length,
                itemBuilder: (BuildContext context, int index) {
                  // Clear Button
                  if (index == 0) {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.blue[50],
                      textColor: Colors.black,
                    );
                  }
                  // +/- button
                  else if (index == 1) {
                    return MyButton(
                      buttonText: buttons[index],
                      color: Colors.blue[50],
                      textColor: Colors.black,
                    );
                  }
                  //% button
                  else if (index == 2) {
                    return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black);
                  }
                  // Delete Button
                  else if (index == 3) {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.blue[50],
                      textColor: Colors.black,
                    );
                  } else if (index == 19) {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.orange[700],
                      textColor: Colors.white,
                    );
                  } else {
                    return MyButton(buttonText: buttons[index]);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '%' || x == '+' || x == '-') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    final String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);

    ContextModel cm = ContextModel();

    final double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer = eval.toString();
  }
}
