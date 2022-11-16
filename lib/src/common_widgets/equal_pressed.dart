import 'package:math_expressions/math_expressions.dart';

class EqualPressed {
  const EqualPressed();
  static String equalPressed(String expressionText, String userInput) {
    final String result;
    final String finalexpressionText = expressionText.replaceAll('x', '*');
    Parser p = Parser();
    try {
      Expression exp = p.parse(finalexpressionText);

      ContextModel cm = ContextModel();

      final double eval = exp.evaluate(EvaluationType.REAL, cm);

      result = eval.toString();

      return result;
    } catch (e) {
      return userInput;
    }
  }
}
