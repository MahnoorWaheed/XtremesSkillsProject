import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtremes_skills/modules/User%20Screens/first_screen.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/bottom_nav.dart';

import 'package:xtremes_skills/modules/User%20Screens/location.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/location.dart';

import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
import 'package:xtremes_skills/modules/auth/screen/signup.dart';
import 'package:xtremes_skills/modules/login_otp/screen/otp_screen.dart';
import 'package:xtremes_skills/modules/login_otp/screen/welcome.dart';
import 'package:xtremes_skills/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'modules/User Screens/place_order.dart';
import 'modules/Worker Dashboard/order.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', //id
  'High Importance Notifications', //title
  // 'This channel is used for important notifications',// description
  importance: Importance.high,
  playSound: true
  );

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message : ${message.messageId}");
}


Future<void> main() async { 
  Widget currentpage= const FirstScreen();

   WidgetsFlutterBinding.ensureInitialized();  
    await Firebase.initializeApp();
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var email =prefs.getString('email');
     
     FirebaseMessaging.onBackgroundMessage( _firebaseMessagingBackgroundHandler);
     await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
     ?.createNotificationChannel(channel);

     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
       alert: true,
       badge: true,
       sound: true);

     runApp(GetMaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

FirebaseMessaging _messaging = FirebaseMessaging.instance;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  late InitializationSettings initSettings;

  get message => null;
  int _counter = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getToken();
    // initMessaging();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) { 
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification !=null && android != null){
        flutterLocalNotificationsPlugin.show(
         notification.hashCode,
         notification.title,
         notification.body,
         NotificationDetails(
           android: AndroidNotificationDetails(
             channel.id,
             channel.name,
             channelDescription: channel.description,
             color: Colors.blue,
             playSound: true,
             icon: '@mipmap/ic_launcher',
           ),
           
           ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) { 
      print('A new onMessageOpenedApp event was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification != null && android != null){
        showDialog(
          context: context, 
          builder: (_){
            return AlertDialog(
              title: Text(notification.title!),
              content: SingleChildScrollView(child: Column(
                children: [
                  Text(notification.body!),
                ],
              )),

            );
          }
          );
      }
    });
  }


void showNotification(){
  setState(() {
    _counter++;
  });
  flutterLocalNotificationsPlugin.show(0,
   "Testing $_counter",
    "How you doing?", 
    NotificationDetails(
       android: AndroidNotificationDetails(
             channel.id,
             channel.name,
             channelDescription: channel.description,
             importance: Importance.high,
             color: Colors.blue,
             playSound: true,
             icon: '@mipmap/ic_launcher',

    ))
    );
}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       
        title: Text("Push Notification"),
      ),
      body: Center(
       
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showNotification,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
