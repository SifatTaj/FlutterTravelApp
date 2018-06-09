import 'package:flutter/material.dart';

import './NewTab.dart' as newTab;
import './HotelsTab.dart' as hotelsTab;
import './FoodTab.dart' as foodTab;
import './FunTab.dart' as funTab;

class HomeUI extends StatefulWidget {
  @override
  HomeUIState createState() => new HomeUIState();
}

class HomeUIState extends State<HomeUI> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 35.0,
        title: new Text("Singapore", style: new TextStyle(fontSize: 25.0, color: Colors.black87),),
        bottom: new TabBar(
            labelStyle: new TextStyle(fontSize: 15.0),
            unselectedLabelColor: Colors.black87,
            labelColor: Colors.pink,
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
            tabs: <Tab>[
              new Tab(text: "NEW"),
              new Tab(text: "HOTELS"),
              new Tab(text: "FOOD"),
              new Tab(text: "FUN")
            ]
        ),
        elevation: 8.0,
      ),
      body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            new newTab.NewTab(),
            new hotelsTab.Hotels(),
            new foodTab.Food(),
            new funTab.Fun()
          ]),
    );
  }
}