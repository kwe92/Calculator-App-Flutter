/*


import 'package:flutter/material.dart';
import 'package:calculatorapp/src/common_widgets/buttons.dart';
import 'package:calculatorapp/src/Constants/button_values.dart';
import 'package:calculatorapp/src/old_version/operators.dart';
import 'package:calculatorapp/src/common_widgets/equal_pressed.dart';

//Removed unnecessary expanded and container widgets

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
  var userInputString = '';
  var previousNumber = '';
  var previousOperator = '';
  var equalState = false;
  var clearState = false;
  var operationPressedState = false;
  static const Operation operation = Operation();

  final List<String> buttons = const ButtonValue().buttons;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInputString,
                    style: const TextStyle(fontSize: 24) //TODO: Text Style
                    ,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.fromLTRB(0, 72, 12, 0),
                  child: Text(
                    //answer,
                    userInput,
                    style: const TextStyle(fontSize: 30),
                  ),
                )
              ],
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
                    if (index == 0 && clearState == false) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            equalState = false;
                            clearState = true;
                            operationPressedState = false;
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    } else if (index == 0 && clearState == true) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInputString = '';
                            equalState = false;
                            clearState = false;
                            operationPressedState = false;
                          });
                        },
                        buttonText: 'A/C',
                        color: Colors.blue[50],
                        textColor: Colors.black,
                      );
                    }
                    // +/- button
                    else if (index == 1) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            if (double.parse(userInput).isNegative) {
                              userInput =
                                  double.parse(userInput).abs().toString();
                            } else {
                              userInput =
                                  (double.parse(userInput) * -1).toString();
                            }
                          });
                        },
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
                              if (userInput.isNotEmpty) {
                                userInput =
                                    (double.parse(userInput) / 100).toString();
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
                            if (equalState) {
                              userInputString =
                                  userInput + previousOperator + previousNumber;
                              userInput =
                                  EqualPressed.equalPressed(userInputString);
                            } else if (userInput.isNotEmpty) {
                              userInputString += userInput;
                              userInput =
                                  EqualPressed.equalPressed(userInputString);
                              equalState = true;
                            } else {
                              userInput =
                                  EqualPressed.equalPressed(userInputString);
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orange[700],
                        textColor: Colors.white,
                      );
                    }
                    // Operator Buttons
                    else if (index == operation.division ||
                        index == operation.multiplication ||
                        index == operation.subtraction ||
                        index == operation.addition) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            if (userInputString.isEmpty && userInput.isEmpty) {
                              userInputString = '';
                            }
                            // ADDED CODE LOGIC NOT WORKING RIGHT
                            /* 
                            
                            else if (userInputString.isNotEmpty) {
                              if (userInputString[
                                          userInputString.length - 1] ==
                                      '/' ||
                                  userInputString[
                                          userInputString.length - 1] ==
                                      'x' ||
                                  userInputString[userInputString.length - 1] ==
                                      '+' ||
                                  userInputString[userInputString.length - 1] ==
                                      '-') {
                                userInputString = userInputString.substring(
                                        0, userInputString.length - 1) +
                                    buttons[index];
                              }
                            }
    
                            */

                            else if (userInputString.isEmpty) {
                              previousOperator = buttons[index];
                              print('PREVIOUS Operator 1:$previousOperator');
                              userInputString += userInput + buttons[index];
                              userInput = '';
                              equalState = false;
                              operationPressedState = true;
                            } else if (equalState) {
                              previousOperator = buttons[index];
                              print('PREVIOUS Operator 2: $previousOperator');
                              userInputString = userInput + buttons[index];
                              userInput = '';
                              equalState = false;
                              operationPressedState = true;
                            } else if (operationPressedState) {
                              userInputString = userInputString.substring(
                                      0, userInputString.length - 1) +
                                  buttons[index];
                            } else {
                              //previousExpression = buttons[index] + userInput;
                              previousOperator = buttons[index];
                              print('PREVIOUS Operator 3: $previousOperator');
                              userInputString += userInput + buttons[index];
                              userInput = '';
                              equalState = false;
                              operationPressedState = true;
                            }
                          });
                        },
                        buttonText: buttons[index],
                        textColor: Colors.black,
                        color: Colors.blueAccent,
                      );
                    }
                    // All Other Buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            //TODO: Set up more complex functionality
                            userInput += buttons[index];
                            previousNumber = userInput;
                            print('PREVIOUS NUMBER PRESSED $previousNumber');
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.white,
                        textColor: Colors.black,
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
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
}
 */