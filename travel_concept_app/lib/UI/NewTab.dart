import 'package:flutter/material.dart';

import '../Pages/DetailsPage.dart';

import '../Elements/CustomCard.dart' as myCard;
import '../Elements/CardLabel.dart' as label;

class NewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 40.0),
      children: <Widget>[
        new Text('     TOP', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87)),
        new Padding(padding: new EdgeInsets.only(bottom: 10.0)),
        new Container(
          height: 200.0,
          child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new myCard.CustomCard('assets/marina.jpg', () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new DetailsPage()))),
                    new Container(
                        width: 150.0,
                        child: new label.CardLabel('The pool on roof of the hotel...')
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new myCard.CustomCard('assets/cloud_forest.jpg', null),
                    new Container(
                        width: 150.0,
                        child: new label.CardLabel('Wonderful Cloud Forest...')
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new myCard.CustomCard('assets/esplanade.jpg', null),
                    new Container(
                        width: 150.0,
                        child: new label.CardLabel('Esplanade in Singapore...')
                    )
                  ],
                )
              ]
          ),
        ),
        new Padding(padding: new EdgeInsets.only(top: 20.0)),
        new Text('     INTEREST', style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87)),
        new Padding(padding: new EdgeInsets.only(bottom: 10.0)),
        new Container(
          height: 200.0,
          child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new myCard.CustomCard('assets/underwater.jpg', null),
                    new Container(
                        width: 150.0,
                        child: new label.CardLabel('Aquarium "Underwater World"...')
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new myCard.CustomCard('assets/garden.jpg', null),
                    new Container(
                        width: 150.0,
                        child: new label.CardLabel('Gardens by the Bay...')
                    )
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new myCard.CustomCard('assets/wheel.jpg', null),
                    new Container(
                        width: 150.0,
                        child: new label.CardLabel('The Singapore Wheel...')
                    )
                  ],
                )
              ]
          ),
        ),
      ],
    );
  }
}