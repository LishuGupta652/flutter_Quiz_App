import 'package:flutter/material.dart';
import 'package:flutter_again/pages/landing_page.dart';

class ScoresPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScoresPage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Your Score ',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0),
            ),
            new Text(
              score.toString() + "/" + totalQuestions.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0),
            ),
            new IconButton(
                icon: Icon(Icons.arrow_right),
                color: Colors.white,
                iconSize: 50.0,
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LandingPage()),
                    (Route route) => route == null))
          ],
        ));
  }
}
