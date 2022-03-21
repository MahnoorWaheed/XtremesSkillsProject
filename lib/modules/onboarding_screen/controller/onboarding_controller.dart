import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:xtremes_skills/model/onboarding_model.dart';
import 'package:xtremes_skills/modules/User%20Screens/first_screen.dart';



class OnboardingController extends GetxController{
  var selectedpageindex=0.obs;
  bool get isLastPage => selectedpageindex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.to(FirstScreen());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/services.svg', 
    'Welcome to Xtreme Skills',
        'The only app you need to take care of every thing at home!',
        ),
    OnboardingInfo('assets/select.svg', 'Select Services',
        'Here you can select services according to your need in just one click ', ),
    OnboardingInfo('assets/location.svg', 'Help us find you',
        'Turn on location services to tell us your exact location so the service team can reach you easily ',)
  ];
}