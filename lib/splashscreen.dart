import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xtremes_skills/modules/onboarding_screen/screen/onboardingpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


startSplashScreen() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Get.to(() =>const OnboardingPage());
    });
  }

@override
  void initState() {
    super.initState();
    startSplashScreen();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor:Colors.blue.shade900, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: Stack(
        children: [
         Center(
            child: Container(
            child:Image(
              width:MediaQuery.of(context).size.width*0.5,
              height:MediaQuery.of(context).size.height*0.7,
              image: const AssetImage('assets/logo.png', 
              
              ),
              fit:BoxFit.contain,
            )),
          ),

          Positioned(bottom:100,
                left:MediaQuery.of(context).size.width*0.45,
                child: Container(child: CircularProgressIndicator(
                  color:Colors.blue.shade900,


                ),),),
          

        ],
      ),
    );
  }
} 
