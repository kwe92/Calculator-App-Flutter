import 'package:flutter/material.dart' hide BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as bs;

class CustomNeumorphicAppBar extends StatelessWidget {
  const CustomNeumorphicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 16.0, 16.0),
        //alignment: Alignment.bottomRight,
        height: 50,
        width: 370,
        decoration: bs.BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[100],
          boxShadow: [
            // Right Shadow
            bs.BoxShadow(
                offset: const Offset(3, 3),
                color: Colors.grey[300]!,
                inset: false),
            // Left Shadow
            const bs.BoxShadow(
                offset: Offset(-3, -3), color: Colors.white, inset: false),
          ],
        ),
        child: const Center(
          child: Text(
            'Custom Neumorphic Design',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
