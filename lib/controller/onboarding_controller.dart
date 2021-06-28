import 'package:flutter/cupertino.dart';
import 'package:flutter_onboarding/model/onboarding.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var selectedIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedIndex.value == mockonBoarding.length;

  void nextPage() {
    if (isLastPage) {
      //do something
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  void beckPage() {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }
}
