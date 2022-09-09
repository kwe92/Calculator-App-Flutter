import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {required this.color,
      required this.textColor,
      required this.buttonText,
      required this.buttontapped,
      required this.fontSize,
      Key? key})
      : super(key: key);

  final Color? color;
  final Color? textColor;
  final String buttonText;
  final double fontSize;
  final void Function()? buttontapped;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: Border.all(
          color: Colors.black26,
        ),
        elevation: 0,
        onPressed: buttontapped,
        child: Container(
          color: color,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
