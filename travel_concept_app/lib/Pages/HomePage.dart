import 'package:flutter/material.dart';

import '../UI/HomeUI.dart' as homeUI;

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 35.0,
        title: new TextField(
          decoration: new InputDecoration(
              icon: new Icon(Icons.search),
              border: new UnderlineInputBorder(),
              hintText: 'Search'
          ),
        ),
        elevation: 0.0,
      ),
      body: new Material(
        child: new homeUI.HomeUI(),
      )
    );
  }
}