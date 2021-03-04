import 'package:flutter/material.dart';
import 'package:widget_flutter_utils/widget/List/Card_Beautiful_Widget.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  // List lista = [1,2,3,3];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'prueba',
      routes: {
        'prueba'  : (BuildContext context) => SlidingCardsView(),
      },);
  }
}