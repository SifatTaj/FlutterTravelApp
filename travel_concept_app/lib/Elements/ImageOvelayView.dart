import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageOverlayView extends StatefulWidget {

  final VoidCallback _onTap;
  final String _image;

  ImageOverlayView(this._image, this._onTap);

  @override
  State createState() => new ImageOverlayViewState();
}

class ImageOverlayViewState extends State<ImageOverlayView> with SingleTickerProviderStateMixin {

  Animation<double> imageAnimation;
  AnimationController imageAnimationController;

  @override
  void initState() {
    super.initState();
    imageAnimationController = new AnimationController(duration: new Duration(milliseconds: 1000),vsync: this);
    imageAnimation = new CurvedAnimation(parent: imageAnimationController, curve: Curves.elasticOut);
    imageAnimation.addListener(() => this.setState(() {}));
    imageAnimationController.forward();
  }

  @override
  void dispose() {
    imageAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Container(
                padding: EdgeInsets.all(0.0),
                height: imageAnimation.value * 300.0,
                width: imageAnimation.value * 300.0,
                child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget._image,
                  fit: BoxFit.fill,
                )
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom:20.0),
            ),
            new Text("Image Description Here", style: new TextStyle(color: Colors.white, fontSize: imageAnimation.value * 30.0))
          ],
        ),
      ),
    );
  }
}