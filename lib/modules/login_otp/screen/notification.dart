import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

void msg() async{

  
       FirebaseMessaging.onBackgroundMessage( _firebaseMessagingBackgroundHandler);
     await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
     ?.createNotificationChannel(channel);

     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
       alert: true,
       badge: true,
       sound: true);

       print("function call");
}


class NotificationData extends StatefulWidget {
  // const Notification({ Key? key }) : super(key: key);

  @override
  State<NotificationData> createState() => _NotificationDataState();
}

class _NotificationDataState extends State<NotificationData> {
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
}