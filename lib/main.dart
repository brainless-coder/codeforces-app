import 'package:flutter/material.dart';
import 'screens/searchScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CodeForces App",
      // theme: ThemeData.from(
      //   colorScheme: ColorScheme.dark().copyWith(
      //       // background: Color(),
      //       ),
      // ),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: SearchScreen(),
    );
  }
}
