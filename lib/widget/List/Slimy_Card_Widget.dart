import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:slimy_card/slimy_card.dart';

class SlimyCardPage extends StatelessWidget {

  // const SlimyCardPage(
  //   {Key key}
  //   );

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
                // In topCardWidget below, imagePath changes according to the
                // status of the SlimyCard(snapshot.data).
                topCardWidget: topCardWidget((snapshot.data)
                                    ? 'assets/yo.jpg'
                                    : 'assets/gitana.jpg'),
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
          'The Rock',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Text(
          'He asks, what your name is. But!',
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
      'It doesn\'t matter \nwhat your name is.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }

}