import 'package:calculatorapp/src/features/calculator_page/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // initalier list

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: NeumorphicApp(
        // debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',
        // themeMode: ThemeMode.dark,
        // theme: NeumorphicThemeData(
        //   baseColor: Color(0xFFFFFFFF),
        //   lightSource: LightSource.topLeft,
        //   depth: 10,
        // ),
        // darkTheme: NeumorphicThemeData(
        //   baseColor: AppColor.main,
        //   lightSource: LightSource.topLeft,
        //   depth: 6,
        // ),
        home: CalculatorPage(),
      ),
    );
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false, // Faster compile time??
    //   home: CalculatorScreen(),
    // );
  }
}
