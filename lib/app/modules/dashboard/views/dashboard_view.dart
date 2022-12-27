import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jana_aastha/app/modules/custom_drawer/views/custom_drawer_view.dart';
import 'package:jana_aastha/app/modules/e_paper/views/e_paper_view.dart';

import 'package:jana_aastha/app/modules/explore/views/explore_view.dart';
import 'package:jana_aastha/app/modules/home/views/home_view.dart';
import 'package:jana_aastha/app/modules/recent_news/views/recent_news_view.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:nepali_utils/nepali_utils.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  static List<BottomNavOptions> options = [
    BottomNavOptions(
      name: "Home",
      icon: Icons.home_filled,
    ),
    // BottomNavOptions(name: "Search", icon: Icons.search),
    BottomNavOptions(name: "My news", icon: Icons.newspaper),
    BottomNavOptions(name: "Explore", icon: CupertinoIcons.compass),
  ];

  static List<Widget> views = [
    HomeView(),
    RecentNewsView(),
    ExploreView(),
    // SearchView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 110.r,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo1.png',
                        height: 40.r,
                      ),
                      SizedBox(
                        height: 5.r,
                      ),
                      Text(
                        "${NepaliUnicode.convert(NepaliDateFormat("d MMMM y, EEE").format(NepaliDateTime.parse(DateTime.now().toString())))} | ${DateFormat('E').format(DateTime.now())}",
                        textAlign: TextAlign.left,
                        style: dateStyle,
                      ),
                      Text(
                        "${DateFormat('MMM d y').format(DateTime.now())}",
                        textAlign: TextAlign.left,
                        style: dateStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.whiteColor,
                          ),
                          child: IconButton(
                              onPressed: () => Get.to(() => EPaperView()),
                              icon: Icon(
                                Icons.newspaper,
                                color: AppColors.secColor,
                              )),
                        ),
                        SizedBox(
                          width: 10.r,
                        ),
                        Builder(builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.whiteColor,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: AppColors.secColor,
                                )),
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
              backgroundColor: AppColors.primaryColor,
              automaticallyImplyLeading: false,
            ),
            drawer: CustomDrawerView(),
            backgroundColor: Theme.of(context).colorScheme.background,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.tabIndex,
              onTap: controller.changeTabIndex,
              items: options
                  .map(
                    (option) => BottomNavigationBarItem(
                      icon: Icon(option.icon),
                      label: option.name,
                    ),
                  )
                  .toList(),
            ),
            // body: Container(),
            body: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return views[index];
                }));
      },
    );
  }
}

class BottomNavOptions {
  String name;
  IconData icon;
  BottomNavOptions({
    required this.name,
    required this.icon,
  });
}
