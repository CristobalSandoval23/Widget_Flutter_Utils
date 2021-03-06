
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

import 'package:widget_flutter_utils/widget/card/Card_Parallax_Widget.dart';
import 'package:widget_flutter_utils/widget/card/Slimy_Card_Widget.dart';
import 'package:widget_flutter_utils/widget/notification/notification_Widget.dart';
import 'package:flutter/services.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;
    bool _canCheckBiometrics = false; 

 final LocalAuthentication _localAth = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    
    _checkBiometrics();
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

Future<void> _checkBiometrics() async {
     bool canCheckBiometrics;
    try {
      canCheckBiometrics = await _localAth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:   
    SizedBox(
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
                  onPressed:() {
                    Navigator.pushNamed(context, 'prueba5');

                   
            // final NotificationWidget noti= new NotificationWidget(title: 'ff',mensaje: 'ff',temporizador: 1);

            //           noti.init();
            //           noti.zonedScheduleNotification(DateTime.friday);
                  },
                 child:Icon( Icons.notification_important )),
                  SizedBox(width: 10,),
            FloatingActionButton(
                  onPressed:() {
                     final NotificationWidget noti= new NotificationWidget(title: 'ff',mensaje: 'ff',temporizador: 1);

                      noti.init();
                      noti.showNotification();
                  },
        child:Icon( Icons.notifications )),
                  SizedBox(width: 10,),
            FloatingActionButton(
                  onPressed:() async{
            // if (value > 0 && category != "") {
              // _checkBiometrics();
              if (_canCheckBiometrics) {
                // bool didAuthenticate =
                    // await _localAth.authenticateWithBiometrics(
                    await _localAth.authenticate(
                   localizedReason: "Porfavor identifiquese!",
                   useErrorDialogs: true,
                   biometricOnly: true,
                   stickyAuth: true,
                   androidAuthStrings: AndroidAuthMessages(
                      biometricHint: 'Confirmar',
                      biometricNotRecognized: 'No se reconoce',
                      biometricRequiredTitle: '3',
                      biometricSuccess: '4',
                      cancelButton: 'Cancelar',
                      deviceCredentialsRequiredTitle:'6',
                      deviceCredentialsSetupDescription: '7',
                      goToSettingsButton: '8',
                      goToSettingsDescription: '9',
                      signInTitle: 'Identificate para continuar'

                   )
                   );
              

              }
            // }
            //  final NotificationWidget noti= new NotificationWidget(title: 'holaa',mensaje: 'ff',temporizador: 1);

              // noti.init();
              // noti.periodicallyShowNotification(RepeatInterval.daily);
                  },
        child:Icon( Icons.notifications_active )),
    ] )   
      );
  }

}
