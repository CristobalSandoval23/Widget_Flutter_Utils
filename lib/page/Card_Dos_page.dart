import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:widget_flutter_utils/data/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
      Color primaryTextColor = Color(0xFF414C6B);
      Color secondaryTextColor = Color(0xFFE4979E);
      Color titleTextColor = Colors.white;
      Color contentTextColor = Color(0xff868686);
      Color navigationColor = Color(0xFF6751B5);
      Color gradientStartColor = Color(0xFF0050AC);
      Color gradientEndColor = Color(0xFF9354B9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [gradientStartColor, gradientEndColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.7])),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Explore',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 44,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          DropdownButton(
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'Solar System',
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 24,
                                    color: const Color(0x7cdbf1ff),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                            onChanged: (value) {},
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              // child: Image.asset('assets/.png'),
                            ),
                            underline: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  cardFull(context)
              ],
            ),
          ),
        ),
    );
}

Widget cardFull(BuildContext context) {
      return Container(
      height: 500,
      padding: const EdgeInsets.only(left: 32),
      child: Swiper(
        itemCount: planets.length,
        itemWidth: MediaQuery.of(context).size.width - 2 * 64,
        layout: SwiperLayout.STACK,
        pagination: SwiperPagination(
          builder:
              DotSwiperPaginationBuilder(activeSize: 20, space: 8),
        ),
        itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, a, b) => detailCard(
                                        context,
                                        planets[index],
                                        primaryTextColor,
                                        contentTextColor
                                        ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        SizedBox(height: 100),
                                        Card(
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(32),
                                          ),
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(32.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(height: 100),
                                                Text(
                                                  planets[index].name,
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 44,
                                                    color: const Color(0xff47455f),
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  'Solar System',
                                                  style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: 23,
                                                    color: primaryTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 32),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Know more',
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 18,
                                    color: secondaryTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: secondaryTextColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Hero(
                  tag: planets[index].position,
                  child: Image.asset(planets[index].iconImage),
                ),
                Positioned(
                  right: 24,
                  bottom: 60,
                  child: Text(
                    planets[index].position.toString(),
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 200,
                      color: primaryTextColor.withOpacity(0.08),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}    

Widget detailCard(BuildContext context, PlanetInfo planetInfo,  Color primaryTextColor, Color contentTextColor) {

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 300),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )
                                ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -64,
              child: Hero(
                  tag: planetInfo.position,
                  child: Image.asset(planetInfo.iconImage)),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                planetInfo.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
