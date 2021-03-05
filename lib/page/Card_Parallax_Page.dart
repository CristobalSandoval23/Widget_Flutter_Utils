import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import 'package:widget_flutter_utils/widget/card/Card_Parallax_Widget.dart';
import 'package:widget_flutter_utils/widget/card/Slimy_Card_Widget.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
            date: '4.20-30',
            assetName: '1.jpg',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Dawan District, Guangdong Hong Kong and Macao',
            date: '4.28-31',
            assetName: '2.jpg',
            offset: pageOffset - 1,
          ),
          SlimyCardPage(
            urlImagenBack: 'assets/1.jpg', 
            urlImagenFront: 'assets/2.jpg', 
            colorDeFondo: Colors.blue,
            titulo: 'Soy cristobal',
            subtitulo: 'Soy Chileno',
            textButtonBack: 'Saludoooooss!!!',),
        ],
      ),
    );
  }
}
