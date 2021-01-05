import 'dart:convert';

import 'package:codeforces_app/screens/infoScreen.dart';
import 'package:codeforces_app/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String handle;

  void getInfo() async {
    NetworkHelper networkHelper = NetworkHelper(handle);
    var data = await networkHelper.getData();

    if (data != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoScreen(data: data)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 42),
                child: TextField(
                  onChanged: (value) {
                    handle = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter CF Handle",
                  ),
                ),
              ),
              SizedBox(height: 70),
              RaisedButton(
                onPressed: getInfo,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                color: Colors.deepPurple.shade400,
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
