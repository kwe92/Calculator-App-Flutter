import 'package:calculatorapp/src/common_widgets/buttons.dart';
import 'package:calculatorapp/src/features/calculator_page/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:calculatorapp/src/Constants/button_values.dart';
import 'package:calculatorapp/src/common_widgets/equal_pressed.dart';
import 'package:calculatorapp/src/constants/layout.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Calculator functionality clear / all clear tweek
// TODO: Calculator functionality operator buttons tweek
// TODO: Add simple comments and not too verbose

final NeumorphicStyle neuStyle = NeumorphicStyle(
  shape: NeumorphicShape.convex,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30)),
  depth: -10,
  intensity: 10,
  shadowLightColorEmboss: Colors.white,
  shadowDarkColorEmboss: Colors.grey[300],
  lightSource: LightSource.topLeft,
  color: AppColor.main,
  //const Color.fromRGBO(53, 53, 53, 1)
);

class CalculatorScreen extends ConsumerStatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends ConsumerState<CalculatorScreen> {
  var userInput = '';
  var userInputString = '';
  var previousNumber = '';
  var previousOperator = '';
  var equalState = false;
  var clearState = false;
  var operationPressedState = false;

  final List<String> buttons = const ButtonValue().buttons;

  void pressButton() async {
    ref.read(isPressedProvider.state).state = true;
    await Future.delayed(const Duration(milliseconds: 50));
    ref.read(isPressedProvider.state).state = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.main,
        appBar: NeumorphicAppBar(

            //color: Colors.grey[900],
            title: const Text(
          'Simple Calculator',
          style: TextStyle(
              fontSize: 22,
              color: AppColor.textMain), //TODO: Title text styling
        )
            // AppBar(
            // backgroundColor: Colors.grey[900],
            // title: const Text(
            //   'Simple Calculator',
            //   style: TextStyle(
            //       fontSize: 22,
            //       color: Colors.white), //TODO: Title text styling
            // ),
            // ),
            ),
        body: Column(
          children: <Widget>[
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Neumorphic(
                  style: neuStyle,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(Sizes.p20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userInputString,
                          style: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(
                                  255, 87, 44, 44)) //TODO: Text Style
                          ,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.fromLTRB(
                            0, 72, Sizes.p12, Sizes.p12),
                        child: Text(
                          //answer,
                          userInput,
                          style: const TextStyle(
                              fontSize: Sizes.p32,
                              color:
                                  AppColor.textMain), // may need to be smaller
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 16),
                itemCount: buttons.length,
                itemBuilder: (BuildContext context, int index) {
                  // Clear Button
                  if (index == ButtonValue.clear && clearState == false) {
                    return CalculatorButton(
                      buttontapped: () {
                        setState(() {
                          userInput = '';
                          equalState = false;
                          clearState = true;
                          operationPressedState = false;
                        });
                        //pressButton();
                      },
                      buttonText: buttons[index],
                      color: AppColor.main,
                      textColor: AppColor.textMain,
                      fontSize: 22,
                    );
                  } else if (index == ButtonValue.clear && clearState == true) {
                    return CalculatorButton(
                      buttontapped: () {
                        setState(() {
                          userInputString = '';
                          equalState = false;
                          clearState = false;
                          operationPressedState = false;
                        });
                        //pressButton();
                      },
                      buttonText: 'A/C',
                      color: AppColor.main,
                      textColor: AppColor.textMain,
                      fontSize: 22,
                    );
                  }
                  // +/- button
                  else if (index == ButtonValue.plusMinus) {
                    return CalculatorButton(
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
                        //pressButton();
                      },
                      buttonText: buttons[index],
                      color: AppColor.main,
                      textColor: AppColor.textMain,
                      fontSize: 22,
                    );
                  }
                  // PERCENTAGE BUTTON
                  else if (index == ButtonValue.percentage) {
                    return CalculatorButton(
                      buttontapped: () {
                        setState(() {
                          if (userInput.isNotEmpty) {
                            userInput =
                                (double.parse(userInput) / 100).toString();
                          }
                        });
                        //pressButton();
                      },
                      buttonText: buttons[index],
                      color: AppColor.main,
                      textColor: AppColor.textMain,
                      fontSize: 22,
                    );
                  }

                  // EQUAL BUTTON
                  else if (index == ButtonValue.equal) {
                    return CalculatorButton(
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
                        //pressButton();
                      },
                      buttonText: buttons[index],
                      color: Colors.orange[600],
                      textColor: AppColor.main,
                      fontSize: 22,
                    );
                  }
                  // OPERATOR BUTTONS
                  else if (index == ButtonValue.division ||
                      index == ButtonValue.multiplication ||
                      index == ButtonValue.subtraction ||
                      index == ButtonValue.addition ||
                      index == ButtonValue.exponent) {
                    return CalculatorButton(
                      buttontapped: () {
                        setState(() {
                          if (userInputString.isEmpty && userInput.isEmpty) {
                            userInputString = '';
                          } else if (userInputString.isEmpty) {
                            previousOperator = buttons[index];
                            //print('PREVIOUS Operator 1:$previousOperator');
                            userInputString += userInput + buttons[index];
                            userInput = '';
                            equalState = false;
                            operationPressedState = true;
                          } else if (equalState) {
                            previousOperator = buttons[index];
                            //print('PREVIOUS Operator 2: $previousOperator');
                            userInputString = userInput + buttons[index];
                            userInput = '';
                            equalState = false;
                            operationPressedState = true;
                          } else if (operationPressedState) {
                            userInputString = userInputString.substring(
                                    0, userInputString.length - 1) +
                                buttons[index];
                          } else {
                            previousOperator = buttons[index];
                            //print('PREVIOUS Operator 3: $previousOperator');
                            userInputString += userInput + buttons[index];
                            userInput = '';
                            equalState = false;
                            operationPressedState = true;
                          }
                        });
                        //pressButton();
                      },
                      buttonText: buttons[index],
                      color: AppColor.secondary,
                      textColor: AppColor.main,
                      fontSize: Sizes.p32,
                    );
                  }
                  // ALL OTHER BUTTONS
                  else {
                    return CalculatorButton(
                      buttontapped: () {
                        setState(() {
                          userInput += buttons[index];
                          previousNumber = userInput;
                          //print('PREVIOUS NUMBER PRESSED $previousNumber');
                        });
                        //pressButton();
                      },
                      buttonText: buttons[index],
                      color: AppColor.main,
                      textColor: AppColor.textMain,
                      fontSize: 22,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
