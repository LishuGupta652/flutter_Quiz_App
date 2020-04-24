import 'package:flutter/material.dart';
import 'dart:math';

class OverlayPage extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  OverlayPage(this._isCorrect, this._onTap);

  @override
  State createState() => new OverlayPageState();
}

class OverlayPageState extends State<OverlayPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black54,
        child: new InkWell(
          onTap: () => widget._onTap(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Transform.rotate(
                  angle: _iconAnimation.value * 2 * pi,
                  child: Icon(
                    widget._isCorrect == true ? Icons.done : Icons.clear,
                    size: 80.0,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
              Text(widget._isCorrect == true ? "Correct" : "Wrong",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ))
            ],
          ),
        ));
  }
}
