
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:xtremes_skills/modules/User%20Screens/first_screen.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/location.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
import 'package:xtremes_skills/modules/login_otp/screen/otp_screen.dart';
import 'package:xtremes_skills/modules/login_otp/controller/auth_service.dart';
import 'package:xtremes_skills/modules/login_otp/screen/home_page.dart';
import 'package:xtremes_skills/modules/login_otp/screen/welcome.dart';
import 'package:xtremes_skills/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';




void main() async {
  //1
WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthClass authClass = AuthClass();

   Widget currentPage = FirstScreen();


  checkLogin() async {
    String? tokne = await authClass.getToken();
    print("tokne");
    if (tokne != null)
      setState(() {
        currentPage = HomePage();
      });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // home: LocationData(),
      home: currentPage,




      
    );
  }
}
