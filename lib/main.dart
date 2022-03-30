
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xtremes_skills/modules/User%20Screens/dashboard.dart';
import 'package:xtremes_skills/modules/User%20Screens/first_screen.dart';
import 'package:xtremes_skills/modules/Worker%20Dashboard/skills.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:xtremes_skills/widgets/formwidget/form.dart';

import 'modules/Worker Dashboard/multi_form.dart';
import 'modules/Worker Dashboard/worker_location.dart';

import 'package:flutter/src/widgets/framework.dart';







// void main() async {
//   //1
// WidgetsFlutterBinding.ensureInitialized();

// await Firebase.initializeApp();

//   runApp(MyApp());
// }
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();


     SharedPreferences prefs = await SharedPreferences.getInstance();
     var email =prefs.getString('email');
     runApp(MaterialApp(home: email== null ?  MyApp(): skills()));
     //const skills(),));

    //  SharedPreferences prefs = await SharedPreferences.getInstance();
    //  var email =prefs.getString('email');
     runApp(
       MyApp() 
      //  MaterialApp(home: email== null ?  MyApp(): skills(),
      );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // AuthClass authClass = AuthClass();
 String? email;
 
  //  Widget currentPage = LocationData();
  getUser() async{
SharedPreferences prefs = await SharedPreferences.getInstance();
      email =prefs.getString('email');
      
  }
  

@override
  void initState() {
    // TODO: implement initState
    super.initState();
getUser();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


      home: skills(),

      // home: email== null ?  MyApp(): skills(),
         home: DasboardUser(),


    );
  }
}

