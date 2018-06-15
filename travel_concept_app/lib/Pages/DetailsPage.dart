import 'package:flutter/material.dart';

import '../Elements/CustomCard.dart' as myCard;
import '../Elements/ImageOvelayView.dart' as overlay;

class DetailsPage extends StatefulWidget {

  final String imageURL;

  DetailsPage(this.imageURL);

  @override
  DetailsPageState createState() => new DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin{
  
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  bool overlayVisibility = false;
  bool iconPressed = false;
  Icon favIcon = new Icon(Icons.favorite_border, color: Colors.black87, size: 30.0);
  String imageLink = "";

  void showOverlay(String image) {
    this.setState(() {
      overlayVisibility = true;
      imageLink = image;
    });
  }

  void hideOverlay() {
    this.setState(() => overlayVisibility = false);
  }

  void favIconPressed() {
    if (!iconPressed) {
      this.setState(() {
        favIcon = new Icon(Icons.favorite, color: Colors.pink, size: 30.0);
        iconPressed = true;
      });
    }
    else {
      this.setState(() {
        favIcon =
        new Icon(Icons.favorite_border, color: Colors.black87, size: 30.0);
        iconPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double gridWidth = MediaQuery.of(context).size.width;
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Scaffold(
          appBar: new AppBar(
            actions: <Widget>[
              new IconButton(
                  icon: favIcon,
                  onPressed: favIconPressed)
            ],
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: new IconButton(
                icon: new Icon(Icons.keyboard_arrow_left, color: Colors.black87, size: 40.0),
                onPressed: () => Navigator.pop(context)
            ),
          ),
          body: new ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.only(left: 20.0, right: 20.0),
                child: new Column(
                  children: <Widget>[
                    new Text("The pool on roof of the hotel Marina Bay Sands", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
                    new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    new Row(
                      children: <Widget>[
                        new Text ("Singapore", style: new TextStyle(fontSize: 15.0, color: Colors.grey),)
                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    new Row(
                      children: <Widget>[
                        new Icon(Icons.star, color: Colors.yellow),
                        new Icon(Icons.star, color: Colors.yellow),
                        new Icon(Icons.star, color: Colors.yellow),
                        new Icon(Icons.star, color: Colors.yellow),
                        new Icon(Icons.star_half, color: Colors.yellow),
                        new Expanded(
                          child: new Text("22,593 reviews", textAlign: TextAlign.right,),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),
              new Row(
                children: <Widget>[
                  new Container(
                    width: gridWidth * .55,
                    height: gridWidth * .55,
                    child: new myCard.CustomCard(widget.imageURL, () => showOverlay(widget.imageURL)),
                  ),
                  new Container(
                      height: gridWidth * .55,
                      width: gridWidth * .35,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            height: (gridWidth * .55)/3,
                            width: gridWidth * .35,
                            child: new myCard.CustomCard(widget.imageURL, () => showOverlay(widget.imageURL)),
                          ),
                          new Container(
                              height: (gridWidth * .55)/3,
                              child: new Row(
                                children: <Widget>[
                                  new Container(
                                    height: (gridWidth * .55)/3,
                                    width: (gridWidth * .35)/2,
                                    child: new myCard.CustomCard(widget.imageURL, () => showOverlay(widget.imageURL)),
                                  ),
                                  new Container(
                                    height: (gridWidth * .55)/3,
                                    width: (gridWidth * .35)/2,
                                    child: new myCard.CustomCard(widget.imageURL, () => showOverlay(widget.imageURL)),
                                  )
                                ],
                              )
                          ),
                          new Container(
                              height: (gridWidth * .55)/3,
                              child: new Row(
                                children: <Widget>[
                                  new Container(
                                    height: (gridWidth * .55)/3,
                                    width: (gridWidth * .35)/2,
                                    child: new myCard.CustomCard(widget.imageURL, () => showOverlay(widget.imageURL)),
                                  ),
                                  new Container(
                                    height: (gridWidth * .55)/3,
                                    width: (gridWidth * .35)/2,
                                    child: new myCard.CustomCard(widget.imageURL, () => {}),
                                  )
                                ],
                              )
                          ),
                        ],
                      )
                  )
                ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 20.0)),
              new Row(
                children: <Widget>[
                  new Container(
                    height: 100.0,
                    width: 150.0,
                    child: new Column(
                      children: <Widget>[
                        new Row(children: <Widget>[new Text("Location", style: new TextStyle(fontSize: 20.0)),]),
                        new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                        new Text("10 Bayfront Avenue, 018956", style: new TextStyle(fontSize: 15.0),),
                        new Row(children: <Widget>[new Text("Singapore", style: new TextStyle(fontSize: 15.0)),]),
                      ],
                    )
                  ),
                  new Expanded(
                      child: new Image(
                          image: new AssetImage('assets/map.jpg'),
                      )
                  )
                ],
              ),
              new Padding(padding: EdgeInsets.only(bottom: 30.0)),
              new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ullamcorper magna sit amet orci congue, ut ultricies massa interdum. Duis in viverra nisi. In id lacus ultrices, eleifend enim nec, facilisis tortor. Aliquam nec commodo dui. Etiam eget mollis odio. Praesent convallis enim diam, eget accumsan magna consequat quis. Aliquam id urna metus. Sed dapibus ipsum vitae viverra posuere. Nunc posuere ornare turpis, pulvinar fermentum orci dignissim at. Etiam eget lobortis tellus. Vestibulum efficitur placerat sem, a laoreet tortor dignissim ultrices. Integer semper, tellus ac tincidunt condimentum, lorem nisl volutpat lorem, quis commodo erat ante sed ex.", style: new TextStyle(fontSize: 20.0),),
            ],
          ),
          bottomNavigationBar: new Material(
              elevation: 15.0,
              child: new TabBar(
                  labelColor: Colors.pink,
                  unselectedLabelColor: Colors.black87,
                  controller: tabController,
                  tabs: <Tab>[
                    new Tab(icon: new Icon(Icons.description), text: "Description"),
                    new Tab(icon: new Icon(Icons.star), text: "Reviews"),
                    new Tab(icon: new Icon(Icons.place), text: "Similar Places"),
                  ]
              )
          ),
        ),
        overlayVisibility == true ? new overlay.ImageOverlayView(widget.imageURL, () => hideOverlay()) : new Container(),
      ],
    );
  }
}