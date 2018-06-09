import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final String image;
  final VoidCallback onTap;

  CustomCard(this.image, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InkWell(
      onTap: onTap,
      child: new Card(
        color: Colors.white,
        child: new Image(
          fit: BoxFit.fill,
          image: new AssetImage(image),
          height: 150.0,
          width: 150.0,
        ),
      )
    );
  }
}