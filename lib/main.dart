
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtremes_skills/modules/User%20Screens/first_screen.dart';
import 'package:xtremes_skills/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';




void main() async {
  //1
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),



      
    );
  }
  
}
