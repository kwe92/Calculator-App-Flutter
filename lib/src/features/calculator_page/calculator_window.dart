import 'package:calculatorapp/src/constants/layout.dart';
import 'package:flutter/material.dart' hide BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as bs;

// Custom Neumorphic Window

//TODO: Refactor some properties into variables

class NeumorphicCalculatorWindow extends StatelessWidget {
  const NeumorphicCalculatorWindow(
      {required this.userInputString, required this.userInput, super.key});
  final String userInputString;
  final String userInput;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 8.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 26.0, 16.0),
        decoration: bs.BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.main,
          boxShadow: [
            // Right Shadow
            bs.BoxShadow(
                offset: const Offset(5, 5),
                color: Colors.grey[350]!,
                inset: true),
            // Left Shadow
            const bs.BoxShadow(
                offset: Offset(-5, -5), color: Colors.white, inset: true),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 12.0, 12.0, 0.0),
              alignment: Alignment.topRight,
              child: Text(
                userInputString,
                style: const TextStyle(fontSize: 26.0),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  userInput,
                  style: const TextStyle(fontSize: 26.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
