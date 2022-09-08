import 'package:flutter/material.dart';
import 'package:calculatorapp/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculatorapp/src/Models/button_values.dart';

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

  final List<String> buttons = ButtonValue().buttons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Simple Calculator',
          style: TextStyle(
              fontSize: 24, color: Colors.white), //TODO: Title text styling
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
                      style: const TextStyle(fontSize: 24) //TODO: Text Style
                      ,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.fromLTRB(0, 72, 12, 0),
                    child: Text(
                      answer,
                      style: const TextStyle(fontSize: 30),
                    ),
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
                          answer = '';
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
                            if (userInput.isEmpty) {
                              userInput += buttons[index];
                            } else {
                              userInput += ' ${buttons[index]}';
                            }
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
                          /*
                          var lstUserInput = userInput.split(' ');
                          lstUserInput.removeLast();
                          lstUserInput.forEach((element) {
                            userInput += element;
                          });
                         */

                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.blue[50],
                      textColor: Colors.black,
                    );
                  }
                  // Equal Button
                  else if (index == 18) {
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
                  }
                  // All Other Buttons
                  else {
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          //TODO: Set up the delete button to work with spaces
                          // The bellow is statements is wrong and nees to be fixed
                          if (userInput.isEmpty ||
                              isOperator(userInput.split(' ').last)) {
                            userInput += ' ${buttons[index]} ';
                          } else {
                            userInput += buttons[index];
                          }
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.blueAccent
                          : Colors.white,
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.black,
                    );
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
