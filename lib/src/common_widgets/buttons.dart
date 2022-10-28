import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as bs;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/calculator_page/providers/providers.dart';

//TODO: Fix buttons to individually press / A stateful widget with Parameters?

class CalculatorButton extends StatefulWidget {
  const CalculatorButton(
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
  State<CalculatorButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<CalculatorButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    //final Color backgroundColor = Colors.grey[100]!;
    final Offset distance = isPressed ? const Offset(4, 4) : const Offset(8, 8);
    final double blur = isPressed ? 1 : 5.0;

    return GestureDetector(
      onTap: () {
        () async {
          setState(() {
            isPressed = !isPressed;
          });
          await Future.delayed(const Duration(milliseconds: 100));
          setState(() {
            isPressed = !isPressed;
          });
        }();

        // Callback is called after button tap
        widget.buttontapped!();
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 100),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: widget.color,
            boxShadow: <BoxShadow>[
              // right shadow
              bs.BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  color: Colors.grey[350]!,
                  inset: isPressed),
              // left shadow
              bs.BoxShadow(
                  blurRadius: blur,
                  offset: -distance,
                  color: Colors.white,
                  inset: isPressed)
            ]),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.bold,
                color: widget.textColor),
          ),
        ),
      ),
    );
  }
}






/////////////////////

// class MyButton extends ConsumerWidget {
//   const MyButton(
//       {required this.color,
//       required this.textColor,
//       required this.buttonText,
//       required this.buttontapped,
//       required this.fontSize,
//       Key? key})
//       : super(key: key);

//   final Color? color;
//   final Color? textColor;
//   final String buttonText;
//   final double fontSize;
//   final void Function()? buttontapped;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     bool isPressed = ref.watch(isPressedProvider.state).state;
//     //final Color backgroundColor = Colors.grey[100]!;
//     final Offset distance = isPressed ? const Offset(3, 3) : const Offset(6, 6);
//     final double blur = isPressed ? 1 : 15.0;

//     return GestureDetector(
//       onTap: buttontapped,
//       child: AnimatedContainer(
//         duration: const Duration(microseconds: 50),
//         height: 200,
//         width: 200,
//         decoration: bs.BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: color,
//             boxShadow: [
//               // right shadow
//               bs.BoxShadow(
//                   blurRadius: blur,
//                   offset: distance,
//                   color: Colors.grey[400]!,
//                   inset: isPressed),
//               // left shadow
//               bs.BoxShadow(
//                   blurRadius: blur,
//                   offset: -distance,
//                   color: Colors.white,
//                   inset: isPressed)
//             ]),
//         child: Center(
//           child: Text(
//             buttonText,
//             style: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: textColor),
//           ),
//         ),
//       ),
//     );
//   }
// }


// class MyButton extends StatelessWidget {
//   const MyButton(
//       {required this.color,
//       required this.textColor,
//       required this.buttonText,
//       required this.buttontapped,
//       required this.fontSize,
//       Key? key})
//       : super(key: key);

//   final Color? color;
//   final Color? textColor;
//   final String buttonText;
//   final double fontSize;
//   final void Function()? buttontapped;

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//           minHeight: 10, maxHeight: 10, minWidth: 10, maxWidth: 10),
//       child: NeumorphicButton(
//         onPressed: buttontapped,
//         style: NeumorphicStyle(
//           shape: NeumorphicShape.concave,
//           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
//           depth: 2,
//           lightSource: LightSource.topLeft,
//           shadowLightColor: const Color.fromRGBO(235, 234, 234, 1),
//           shadowDarkColor: const Color.fromRGBO(190, 190, 190, 1),
//           color: color,
//           //const Color.fromRGBO(53, 53, 53, 1)
//         ),
//         child: Center(
//           child: Text(
//             buttonText,
//             style: TextStyle(
//                 fontSize: fontSize,
//                 color: textColor,
//                 fontWeight: FontWeight.w600),
//           ),
//         ),
//       ),
//     );
//   }
// }


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