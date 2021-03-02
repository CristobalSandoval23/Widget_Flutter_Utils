import 'package:flutter/material.dart';
import 'package:widget_flutter_utils/widget/List/DropdowButton_Widget.dart';
import 'package:widget_flutter_utils/widget/List/ListTile_Wdget.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "ListTile",
      routes: {
        'DropdowButton': (BuildContext context) => DropdowButtonPage(),
        'ListTile': (BuildContext context) => ListTilePage(),
      },
    );
  }
}