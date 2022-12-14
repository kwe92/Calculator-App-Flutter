/*

import 'package:flutter/material.dart';
import 'package:calculatorapp/src/constants/app_sizes.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {required this.color,
      required this.textColor,
      required this.buttonText,
      required this.buttontapped,
      Key? key})
      : super(key: key);

  final Color? color;
  final Color? textColor;
  final String buttonText;
  final void Function()? buttontapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor,
                    fontSize: Sizes.p24, // may need to be bigger
                    fontWeight:
                        FontWeight.w600), // TODO: font size and weight  bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}


 */