import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtremes_skills/modules/User%20Screens/first_screen.dart';
import 'package:xtremes_skills/modules/User%20Screens/location.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/location.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
import 'package:xtremes_skills/modules/auth/screen/signup.dart';
import 'package:xtremes_skills/modules/login_otp/screen/otp_screen.dart';
import 'package:xtremes_skills/modules/login_otp/screen/welcome.dart';
import 'package:xtremes_skills/rate.dart';
import 'package:xtremes_skills/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:xtremes_skills/widgets/formwidget/form.dart';

import 'modules/Worker Dashboard/multi_form.dart';




Future<void> main() async { 
  Widget currentpage= const FirstScreen();

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
       home: email== null ? currentpage: const skills(),));

}

