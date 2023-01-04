import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jana_aastha/utils/category_enums.dart';

class DashboardController extends GetxController {
  int tabIndex = 0;
  late PageController pageController;
  late List<CategoryTabs> drawerCategories;
  @override
  void onInit() {
    drawerCategories = CategoryTabs.values
        .where((element) => element.forExplore)
        .toList();
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
