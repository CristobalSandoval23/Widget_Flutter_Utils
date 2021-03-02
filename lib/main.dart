import 'package:flutter/material.dart';
import 'package:widget_flutter_utils/widget/List/ListView_Widget.dart';
 
void main() => runApp(MyApp());
 
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  List lista = [1,2,3,3];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
        home: Scaffold(
          body: ListViewPage(lista: lista),
        ),
    );
  }
}