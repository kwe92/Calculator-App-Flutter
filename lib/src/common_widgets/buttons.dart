import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../constants/layout.dart';

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
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: 10, maxHeight: 10, minWidth: 10, maxWidth: 10),
      child: NeumorphicButton(
        onPressed: buttontapped,
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
          depth: 2,
          lightSource: LightSource.topLeft,
          shadowLightColor: const Color.fromRGBO(235, 234, 234, 1),
          shadowDarkColor: const Color.fromRGBO(190, 190, 190, 1),
          color: color,
          //const Color.fromRGBO(53, 53, 53, 1)
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}


// FloatingActionButton(
//         shape: Border.all(
//           color: Colors.black26,
//         ),
//         elevation: 0,
//         onPressed: buttontapped,
//         child: Container(
//           color: color,
//           child: Center(
//             child: Text(
//               buttonText,
//               style: TextStyle(
//                   fontSize: fontSize,
//                   color: textColor,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//         ));