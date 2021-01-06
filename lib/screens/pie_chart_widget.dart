import 'package:codeforces_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PieGraphScreen extends StatefulWidget {
  final data;
  PieGraphScreen({this.data});

  @override
  _PieGraphScreenState createState() => _PieGraphScreenState();
}

class _PieGraphScreenState extends State<PieGraphScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff020227),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  blurRadius: 2.0,
                  spreadRadius: 3.0,
                  offset: Offset(5.0, 3.0),
                )
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 13),
            padding: EdgeInsets.all(10),
            height: 400,
            width: 400,
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff020227),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  blurRadius: 2.0,
                  spreadRadius: 3.0,
                  offset: Offset(5.0, 3.0),
                )
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 13),
            padding: EdgeInsets.all(10),
            height: 400,
            width: 400,
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff020227),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  blurRadius: 2.0,
                  spreadRadius: 3.0,
                  offset: Offset(5.0, 3.0),
                )
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 13),
            padding: EdgeInsets.all(10),
            height: 400,
            width: 400,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
