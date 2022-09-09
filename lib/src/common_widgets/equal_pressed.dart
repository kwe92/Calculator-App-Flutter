import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class EqualPressed extends Widget {
  const EqualPressed(Key? key) : super(key: key);
  static String equalPressed(String userInput) {
    final String result;
    final String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);

    ContextModel cm = ContextModel();

    final double eval = exp.evaluate(EvaluationType.REAL, cm);

    result = eval.toString();

    return result;
  }

  @override
  Element createElement() {
    throw UnimplementedError();
  }
}
