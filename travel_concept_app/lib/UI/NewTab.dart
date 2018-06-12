import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Pages/DetailsPage.dart';
import '../Elements/LoaderAnimation.dart';

import '../Elements/CustomCard.dart' as myCard;
import '../Elements/CardLabel.dart' as label;

class NewTab extends StatefulWidget {
  @override
  NewTabState createState() {
    return NewTabState();
  }
}

class NewTabState extends State<NewTab> {

  bool loading = false;
  String jsonUrl =
      "https://gist.githubusercontent.com/sh0umik/d8b29ec7f5a9cb1720a8b1c42d58ff44/raw/f720e32ee5ee5c26f4f82a07d039d9809c104de2/flutter_api.json";
  Map data;

  Future<String> getData() async {
    var response = await http
        .get(Uri.encodeFull(jsonUrl), headers: {"Accept": "application/json"});
    setState(() {
      data = JSON.decode(response.body);
      loading = false;
    });

    return "Done!";
  }

  void loadingAnimation() {
    setState(() {
      loading = true;
    });
  }

  @override
  void initState() {
    if (data == null) loading = true;
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(
              top: 40.0, left: 20.0, right: 20.0, bottom: 40.0),
          children: <Widget>[
            new Text('     TOP',
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            new Padding(padding: new EdgeInsets.only(bottom: 10.0)),
            new Container(
                height: 200.0,
                child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data == null ? 0 : data["new"]["top"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Column(
                        children: <Widget>[
                          new myCard.CustomCard(
                              data["new"]["top"][index]["img"],
                              () => Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new DetailsPage()))),
                          new Container(
                              width: 150.0,
                              child: new label.CardLabel(
                                  data["new"]["top"][index]["desc"]))
                        ],
                      );
                    })),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            new Text('     INTEREST',
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            new Padding(padding: new EdgeInsets.only(bottom: 10.0)),
            new Container(
                height: 200.0,
                child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data == null ? 0 : data["new"]["recents"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Column(
                        children: <Widget>[
                          new myCard.CustomCard(
                              data["new"]["recents"][index]["img"],
                              () => Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new DetailsPage()))),
                          new Container(
                              width: 150.0,
                              child: new label.CardLabel(
                                  data["new"]["recents"][index]["desc"]))
                        ],
                      );
                    })),
          ],
        ),
        loading == true ? new Loader() : new Container()
      ],
    );
  }
}
