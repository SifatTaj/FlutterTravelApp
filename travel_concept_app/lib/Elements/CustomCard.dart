import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomCard extends StatelessWidget {
  final String imageURL;
  final VoidCallback onTap;

  CustomCard(this.imageURL, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InkWell(
        onTap: onTap,
        child: new Card(
          color: Colors.white,
          child: new Container(
            height: 150.0,
            width: 150.0,
            child: new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageURL,
              fit: BoxFit.fill,
            ),
//          decoration: new BoxDecoration(
//            image: new DecorationImage(
//                image: new NetworkImage(imageURL),
//                fit: BoxFit.fill
//            )
//          ),
          ),
        ));
  }
}
