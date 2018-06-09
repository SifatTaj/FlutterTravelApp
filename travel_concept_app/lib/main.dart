import 'package:flutter/material.dart';

import './Pages/HomePage.dart' as home;
import './Pages/FavoritesPage.dart' as fav;
import './Pages/ProfilePage.dart' as profile;
import './Pages/SettingsPage.dart' as settings;
import './Pages/DetailsPage.dart' as details;

void main() {
  runApp(new MaterialApp(
    home: new NavigationTabs(),
    theme: new ThemeData(
      textTheme: new TextTheme(
        body1: new TextStyle(color: Colors.black87),
      ),
      indicatorColor: Colors.pink,
      primarySwatch: Colors.pink

    ),
  ));
}

class NavigationTabs extends StatefulWidget {
  @override
  NavigationTabsState createState() => NavigationTabsState();
}

class NavigationTabsState extends State<NavigationTabs> with SingleTickerProviderStateMixin{

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
      bottomNavigationBar: new Material(
        elevation: 15.0,
        child: new TabBar(
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.black87,
            controller: tabController,
            tabs: <Tab>[
              new Tab(icon: new Icon(Icons.home), text: "Home"),
              new Tab(icon: new Icon(Icons.person), text: "Profile"),
              new Tab(icon: new Icon(Icons.favorite), text: "Favorites"),
              new Tab(icon: new Icon(Icons.settings), text: "Settings")
            ]
        )
      ),
      body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            new home.Home(),
            new profile.Profile(),
            new fav.Favorite(),
            new settings.Settings()
          ]
      ),
    );
  }
}