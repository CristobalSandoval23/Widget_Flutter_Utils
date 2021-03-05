
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotificationWidget{
    String title;
  String mensaje;
  int temporizador;
  BuildContext context;

   NotificationWidget({
    this.title,
    this.mensaje,
    this.temporizador,
    });
  FlutterLocalNotificationsPlugin fltrNotification;

 init()async {

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Santiago')); 
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
    new InitializationSettings(android: androidInitilize,iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: _notificationSelected
      );
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
         title, 
         mensaje, 
         generalNotificationDetails, 
         payload: 'Hoooollla');
  }
 Future zonedScheduleNotification(int fecha) async {
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
         title, 
         mensaje, 
         _netxinstanceofFryday(fecha),
         generalNotificationDetails, 
         payload: 'Hoooollla', 
         androidAllowWhileIdle: true,
         uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }

    tz.TZDateTime _netxinstanceofFryday(int fecha) {
    tz.TZDateTime scheduleDate = _nextIntanceOfTenAM();
    while(scheduleDate.weekday  != fecha ){
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }
    return scheduleDate;

  }

  tz.TZDateTime _nextIntanceOfTenAM() {

    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(tz.local, now.year,now.month, now.day,19,41 );
    if( scheduleDate.isBefore(now)){
      scheduleDate = scheduleDate.add(Duration(days: 1));
    }
    return scheduleDate;


  }

 Future periodicallyShowNotification(RepeatInterval repetirCada) async {
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

    await fltrNotification.periodicallyShow(
         0,
         title, 
         mensaje, 
         repetirCada,
         generalNotificationDetails, 
         payload: 'Hoooollla', 
         androidAllowWhileIdle: true);
  }

Future _notificationSelected(String payload) async {
      showDialog(
        context: context,
        builder: (context) => Container(),
      );
}

}
