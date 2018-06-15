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
            child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Center(
                child: new Container(
              height: 50.0,
              width: 50.0,
              child: new CircularProgressIndicator(strokeWidth: 5.0),
            )),
            new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageURL,
              fit: BoxFit.fill,
            ),
          ],
        )),
      ),
    );
  }
}
