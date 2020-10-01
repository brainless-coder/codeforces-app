import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Codeforces());

class Codeforces extends StatefulWidget {
  @override
  _CodeforcesState createState() => _CodeforcesState();
}

class _CodeforcesState extends State<Codeforces> {
  String fullName = '',
      userName = '',
      rank = '',
      maxRank = '',
      organization = '',
      country = '',
      userHandle = ' ';
  int rating = 0, maxRating = 0;

  Future getData() async {
    http.Response response = await http
        .get('https://codeforces.com/api/user.info?handles=$userHandle');

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      setState(() {
        userName = decodedData['result'][0]['handle'];
        String firstName = decodedData['result'][0]['firstName'];
        String lastName = decodedData['result'][0]['lastName'];
        fullName =
            '${firstName == null ? '' : firstName} ${lastName == null ? '' : lastName}';
        rating = decodedData['result'][0]['rating'];
        maxRating = decodedData['result'][0]['maxRating'];
        rank = decodedData['result'][0]['rank'];
        maxRank = decodedData['result'][0]['maxRank'];
        organization = decodedData['result'][0]['organization'];
        country = decodedData['result'][0]['country'];
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codeforces App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF221029),
      ),
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 30, 35, 15),
                  child: TextField(
                    onChanged: (value) {
                      userHandle = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'CF Handle',
                      hintText: 'Enter Codeforces Username',
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    getData();
                  },
                  child: Text('Click for Data'),
                  elevation: 8.0,
                ),
                SizedBox(
                  height: 20,
                ),
                UserText('Username', userName),
                UserText('FullName', fullName),
                UserText('Current Rating', rating == null ? 0 : rating),
                UserText('Max Rating', maxRating == null ? 0 : maxRating),
                UserText('Rank', rank == null ? '' : rank),
                UserText('Max Rank', maxRank == null ? '' : maxRank),
                UserText(
                    'Organization', organization == null ? '' : organization),
                UserText('Country', country == null ? '' : country),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserText extends StatelessWidget {
  UserText(this.field, this.value);

  final field, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Text(
        '$field:  $value',
        style: TextStyle(
          fontSize: 25,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w800,
          color: Colors.yellowAccent,
        ),
      ),
    );
  }
}
