import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {

  final String title;
  final IconData icon;

  CustomChip({this.title,this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.red[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Icon(
                icon,
                color: Colors.red[900],
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
