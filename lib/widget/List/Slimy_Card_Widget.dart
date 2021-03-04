import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:slimy_card/slimy_card.dart';

class SlimyCardPage extends StatelessWidget {

  String urlImagenBack;
  String urlImagenFront;
  String titulo;
  String subtitulo;
  String textButtonBack;
  Color colorDeFondo;

   SlimyCardPage({
     this.urlImagenBack,
     this.urlImagenFront,
     this.titulo,
     this.subtitulo,
     this.textButtonBack,
     this.colorDeFondo = Colors.blue,

      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        // This streamBuilder reads the real-time status of SlimyCard.
        initialData: false,
        stream: slimyCard.stream, //Stream of SlimyCard
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 100),
              // SlimyCard is being called here.
              SlimyCard(
                color: colorDeFondo,
                // In topCardWidget below, imagePath changes according to the
                // status of the SlimyCard(snapshot.data).
                topCardWidget: topCardWidget((snapshot.data)
                                    ? urlImagenBack
                                    : urlImagenFront),
                bottomCardWidget: bottomCardWidget(),
                ),
              ],
            );
          }),
        ),
      );
  }

        
topCardWidget(String imagePath) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          titulo,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Text(
          subtitulo,
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
      ],
    );
}
                
Widget bottomCardWidget() {
    return Text(
      textButtonBack,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }

}