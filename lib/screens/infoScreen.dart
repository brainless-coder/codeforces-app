import 'package:codeforces_app/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codeforces_app/widgets/graphsCard.dart';

class InfoScreen extends StatefulWidget {
  final data;

  InfoScreen({this.data});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String firstName, lastName, country, rank, organization, titlePhoto;
  int rating, maxRating;

  void updateUI(dynamic coderData) {
    setState(() {
      firstName = coderData['result'][0]['firstName'] ?? '';
      lastName = coderData['result'][0]['lastName'] ?? '';
      country = coderData['result'][0]['country'] ?? '';
      rating = coderData['result'][0]['rating'] ?? 0;
      maxRating = coderData['result'][0]['maxRating'] ?? 0;
      rank = coderData['result'][0]['rank'] ?? 'not Ranked';
      organization = coderData['result'][0]['organization'] ?? '';
      titlePhoto = coderData['result'][0]['titlePhoto'];
    });
  }

  @override
  Widget build(BuildContext context) {
    updateUI(widget.data);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https:$titlePhoto'),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '$firstName $lastName'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      rank,
                      style: kInfoStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFF1D1E33),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Rating',
                              textAlign: TextAlign.center,
                              style: kInfoStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Max Rating',
                              textAlign: TextAlign.center,
                              style: kInfoStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '$rating',
                              textAlign: TextAlign.center,
                              style: kInfoStyle,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '$maxRating',
                              textAlign: TextAlign.center,
                              style: kInfoStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          '$organization, $country',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.tealAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  GraphsCard(
                    onTap: () {},
                    icon: Icons.pie_chart_rounded,
                    color: Colors.deepOrangeAccent,
                    title: 'Pie Chart',
                  ),
                  GraphsCard(
                    color: Colors.deepPurple,
                    icon: Icons.multiline_chart,
                    title: 'Chart Analysis',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  GraphsCard(
                    icon: Icons.graphic_eq,
                    color: Colors.lightBlueAccent,
                    title: 'Rank Analysis',
                  ),
                  GraphsCard(
                    icon: Icons.stacked_line_chart_outlined,
                    color: Colors.lightGreenAccent,
                    title: 'Last Graph',
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.laptop_mac),
              label: 'Contests',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: Color(0xFF1D1E33),
          // backgroundColor: Color(0xFF0A0E21),
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
