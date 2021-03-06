
import 'package:flutter/material.dart';

import 'package:widget_flutter_utils/page/Card_Dos_page.dart';
import 'package:widget_flutter_utils/page/Card_Parallax_Page.dart';
import 'package:widget_flutter_utils/page/Card_Simple.dart';


Widget  tabBarViewWidget(){

    return DefaultTabController(
          length: 3,
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          bottom: TabBar(
            tabs: [
            Tab(text: 'Uno',),
            Tab(text: 'dos',),
            Tab(text: 'tres',),
          ],)
        ),
        body: 
        TabBarView(
          children: [
              HomePage(),
              Home(),
              SlidingCardsView()
        ],
        ),
      ),
    );

}
