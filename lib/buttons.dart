import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {this.color,
      this.textColor,
      required this.buttonText,
      this.buttontapped,
      Key? key})
      : super(key: key);

  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

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
                    fontSize: 22,
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
