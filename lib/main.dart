import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtremes_skills/modules/User%20Screens/first_screen.dart';
import 'package:xtremes_skills/modules/User%20Screens/location.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async { 
  Widget currentpage= const PickLocation();

   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var email =prefs.getString('email');
     runApp(GetMaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: email== null ? currentpage: skills(),));
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return Container(
      

    );
  }
}
