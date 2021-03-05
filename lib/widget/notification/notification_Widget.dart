
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotificationPage extends StatelessWidget {
    String title;
  String mensaje;
  int temporizador;
  BuildContext context;

   NotificationPage({
    this.title,
    this.mensaje,
    this.temporizador,
    });
  FlutterLocalNotificationsPlugin fltrNotification;

@override

void initState() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Santiago')); 
      // initializing();
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(android: androidInitilize,iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: _notificationSelected
      );
}

 Future  get showNotification async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
        priority: Priority.high,
        );
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails,iOS: iSODetails);
    await fltrNotification.show(
         0,
         title, 
         mensaje, 
         generalNotificationDetails, 
         payload: 'Hoooollla');
  }
 Future zonedScheduleNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
        priority: Priority.high,
        );
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails,iOS: iSODetails);

    await fltrNotification.zonedSchedule(
         0,
         title, 
         mensaje, 
         tz.TZDateTime.now(tz.local).add(Duration(seconds: temporizador)),
         generalNotificationDetails, 
         payload: 'Hoooollla', 
         androidAllowWhileIdle: true,
         uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }

Future _notificationSelected(String payload) async {
      showDialog(
        context: context,
        builder: (context) => Container(),
      );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }
}
