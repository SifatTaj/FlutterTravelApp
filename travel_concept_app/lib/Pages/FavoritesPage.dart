import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container (
      child: new Center(
        child: new Icon(
            Icons.favorite, size: 180.0
        ),
      ),
    );
  }
}