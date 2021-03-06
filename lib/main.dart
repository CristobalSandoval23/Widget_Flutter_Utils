import 'package:flutter/material.dart';
import 'package:widget_flutter_utils/page/Card_Parallax_Page.dart';
import 'package:widget_flutter_utils/page/Card_Dos_page.dart';
import 'package:widget_flutter_utils/page/Card_Simple.dart';
import 'package:widget_flutter_utils/page/pdf_page.dart';
import 'package:widget_flutter_utils/widget/Huella/Huella_Widget.dart';

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
        'prueba2'  : (BuildContext context) => HomePage(),
        'prueba3'  : (BuildContext context) => Home(),
        'prueba4'  : (BuildContext context) => HuellaDigitalWidget(),
        'prueba5'  : (BuildContext context) => PdfView(),
      },);
  }
}

