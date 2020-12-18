import 'package:flutter/material.dart';
import 'screens/searchScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CodeForces App",
      theme: ThemeData.dark().copyWith(
        backgroundColor: Color(0XFF242A42),
      ),
      home: SearchScreen(),
    );
  }
}
