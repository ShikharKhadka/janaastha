import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  int tabIndex = 0;
  late PageController pageController;

  @override
  void onInit() {
    pageController =
        PageController(keepPage: true, initialPage: 0, viewportFraction: 1);
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    print("THis is index $tabIndex");
    pageController.animateToPage(index,
        curve: Curves.easeIn,
        duration: const Duration(
          milliseconds: 300,
        ));
    update();
  }
}
