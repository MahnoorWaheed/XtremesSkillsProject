import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xtremes_skills/modules/onboarding_screen/screen/onboardingpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSplashScreen(
              duration: 1000,
               splashIconSize: 1000,
              splash: Image.asset("assets/logo.png"),
              nextScreen: const OnboardingPage(),
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              //backgroundColor: Colors.blue
              
            ),
          const Positioned(
            bottom: 150,
            left: 50,
            child: Text("Hey!...\nWelcome To Xtremes Skills", 
            style: TextStyle(
              fontWeight: FontWeight.w700,
             fontSize: 20, color:Color(0xff034baa)),
            ),
          ),
          

        ],
      ),
    );
  }
} 
