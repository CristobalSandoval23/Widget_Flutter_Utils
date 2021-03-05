import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:widget_flutter_utils/page/Card_Dos_page.dart';

// import 'package:flutter/rendering.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'package:widget_flutter_utils/widget/card/Card_Parallax_Widget.dart';
import 'package:widget_flutter_utils/widget/card/Slimy_Card_Widget.dart';
import 'package:widget_flutter_utils/widget/notification/notification_Widget.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {

  FlutterLocalNotificationsPlugin fltrNotification;
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
        tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Santiago')); 
      // initializing();
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(android: androidInitilize,iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected
      );

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

   Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max,
        icon: 'app_icon',
        sound: RawResourceAndroidNotificationSound('breaking_benjamin_far_away'),
        largeIcon: DrawableResourceAndroidBitmap('app_icon'),
        priority: Priority.max,
        color: Colors.blue,
        fullScreenIntent: true, // deja fijo la notification en la Screen in true
        usesChronometer : true, // muestra un cronometro al estar en TRUE
        showProgress: true,
        maxProgress: 10,
        progress: 9,
        subText: 'Termino el descanso',
        );
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails,iOS: iSODetails);
    await fltrNotification.show(
         0,
         'title', 
         'mensaje', 
         generalNotificationDetails, 
         payload: 'Hoooollla');
  }

  Future  zonedScheduleNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max,
        icon: 'app_icon',
        sound: RawResourceAndroidNotificationSound('breaking_benjamin_far_away'),
        largeIcon: DrawableResourceAndroidBitmap('app_icon'),
        priority: Priority.max,
        color: Colors.blue,
        fullScreenIntent: true, // deja fijo la notification en la Screen in true
        usesChronometer : true, // muestra un cronometro al estar en TRUE
        showProgress: true,
        maxProgress: 10,
        progress: 9,
        subText: 'Termino el descanso',
        );
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails,iOS: iSODetails);

    await fltrNotification.zonedSchedule(
         0,
         'title', 
         'mensaje', 
         tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
         generalNotificationDetails, 
         payload: 'Hoooollla', 
         androidAllowWhileIdle: true,
         uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        SizedBox(
          // height: MediaQuery.of(context).size.height * 0.05,
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
        ),
        floatingActionButton:    
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            FloatingActionButton(
                      onPressed: zonedScheduleNotification,
                     child:Icon( Icons.notification_important )),
                      SizedBox(width: 10,),
                FloatingActionButton(
            onPressed: showNotification,
            child:Icon( Icons.notifications )),
        ] )   
    );
  }

      Future notificationSelected(String payload) async {
      showDialog(
        context: context,
        builder: (context) => HomePage(),
      );
    }
}
