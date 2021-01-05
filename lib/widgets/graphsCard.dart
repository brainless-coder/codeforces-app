import 'package:flutter/material.dart';
import 'package:codeforces_app/utilities/constants.dart';

class GraphsCard extends StatelessWidget {
  GraphsCard({this.color, this.title, this.icon, this.onTap});

  final Color color;
  final IconData icon;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF1D1E33),
            border: Border(
              bottom: BorderSide(
                color: color,
                width: 6,
              ),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 50,
                  color: color,
                ),
              ),
              Spacer(),
              Expanded(
                child: Text(
                  title,
                  style: kInfoStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
