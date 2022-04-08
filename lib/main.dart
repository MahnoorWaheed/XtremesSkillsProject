import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtremes_skills/modules/User%20Screens/first_screen.dart';
import 'package:xtremes_skills/modules/User%20Screens/live_location.dart';
import 'package:xtremes_skills/modules/User%20Screens/location.dart';

import 'package:xtremes_skills/modules/Worker%20Dashboard/dialogbox.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/location.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/mychats.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/review.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/showrating.dart';
import 'package:xtremes_skills/modules/User%20Screens/select_task.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/location.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:xtremes_skills/modules/auth/screen/login.dart';
import 'package:xtremes_skills/modules/auth/screen/signup.dart';
import 'package:xtremes_skills/modules/login_otp/screen/welcome.dart';

import 'modules/User Screens/place_order.dart';
import 'modules/Worker Dashboard/order.dart';




Future<void> main() async { 
  Widget currentpage= const PickLocation();

   WidgetsFlutterBinding.ensureInitialized();  
    await Firebase.initializeApp();
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var email =prefs.getString('email');
    
   

    //  msg();
     
    //  FirebaseMessaging.onBackgroundMessage( _firebaseMessagingBackgroundHandler);
    //  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    //  ?.createNotificationChannel(channel);

    //  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    //    alert: true,
    //    badge: true,
    //    sound: true);

     runApp(GetMaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


  //  home: email== null ? currentpage: skills()));


      //  home: Login())

      //  home: PickLocation()));




      //  home: NearbyWorkers()));

       home: LoginScreen()));


}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       
        title: const Text("Push Notification"),
      ),
      body: Center(
       
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
         
          ],
        ),
      ),
     
    );
  }
// void getToken(){
//   _messaging.getToken().then((value){
//    String? token = value;
//    print(token);
//   });
// }

// void initMessaging(){
//   var androiInit = AndroidInitializationSettings("assets/logo.png");
//   var iosInit = IOSInitializationSettings();
//   var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
//   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   flutterLocalNotificationsPlugin.initialize(initSettings);
//   var androidDetails = AndroidNotificationDetails('1', 'Default',
//   channelDescription: "Channel Description",
//   importance: Importance.high,
//   priority: Priority.high
//   );
//   var iosDetails = IOSNotificationDetails();
//   var generalNotificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);
//   FirebaseMessaging.onMessage.listen((event) {
//     RemoteNotification notification = message!.notification;
//     AndroidNotification android = message.notification!.android;
//     if(notification != null && android != null){
//       flutterLocalNotificationsPlugin.show(notification.hashCode, notification.title,notification.body, generalNotificationDetails);
//     }
//    });
// }




}
