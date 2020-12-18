import 'package:flutter/material.dart';
import 'screens/searchScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CodeForces App",
      home: SearchScreen(),
    );
  }
}
