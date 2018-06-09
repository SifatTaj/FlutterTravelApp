import 'package:flutter/material.dart';

class CardLabel extends StatelessWidget {

  final String description;

  CardLabel(this.description);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
        text: new TextSpan(
            children: <TextSpan>[
              new TextSpan(text: description, style: new TextStyle(color: Colors.black87)),
              new TextSpan(text: 'read more', style: new TextStyle(color: Colors.pink))
            ]
        )
    );
  }
}