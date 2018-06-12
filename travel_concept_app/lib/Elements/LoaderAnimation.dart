import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.black54,
      child: new Center(
        child: new CircularProgressIndicator()
      ),
    );
  }
}