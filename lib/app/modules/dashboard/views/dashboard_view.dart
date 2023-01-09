import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:jana_aastha/app/modules/explore/views/explore_view.dart';
import 'package:jana_aastha/app/modules/news/views/news_view.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:jana_aastha/app/routes/app_pages.dart';
import '../controllers/dashboard_controller.dart';
import 'package:jana_aastha/utils/category_enums.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  static List<BottomNavOptions> options = [
    BottomNavOptions(
      name: "Home",
      icon: Icons.home_filled,
    ),
    // BottomNavOptions(name: "Search", icon: Icons.search),
    BottomNavOptions(name: "Recent News", icon: Icons.newspaper),
    BottomNavOptions(name: "Explore", icon: CupertinoIcons.compass),
  ];

  static List<Widget> views = [
    NewsView(
      category: CategoryTabs.home,
      newsListType: NewsListType.regular,
    ),
    NewsView(
      category: CategoryTabs.recent,
      newsListType: NewsListType.regular,
    ),
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
                        NepaliDateFormat.yMMMMEEEEd(Language.nepali)
                            .format(NepaliDateTime.now()),
                        textAlign: TextAlign.left,
                        style: dateStyle,
                      ),
                      Text(
                        "${DateFormat('EEEE').format(DateTime.now())} || ${DateFormat('MMM d y').format(DateTime.now())}",
                        textAlign: TextAlign.left,
                        style: dateStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Row(
                      children: [
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
                        SizedBox(
                          width: 10.r,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.whiteColor,
                          ),
                          child: IconButton(
                              onPressed: () => Get.toNamed(Routes.E_PAPER),
                              icon: Icon(
                                Icons.newspaper,
                                color: AppColors.secColor,
                              )),
                        ),
                        SizedBox(
                          width: 10.r,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.whiteColor,
                          ),
                          child: IconButton(
                              onPressed: () => Get.toNamed(Routes.SEARCH),
                              icon: Icon(
                                Icons.search,
                                color: AppColors.secColor,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              backgroundColor: AppColors.primaryColor,
              automaticallyImplyLeading: false,
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: [
                        DrawerHeader(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.r),
                            child: Image.asset(
                              'assets/images/logo1.png',
                            ),
                          ),
                          decoration:
                              BoxDecoration(color: AppColors.primaryColor),
                        ),
                        ...controller.drawerCategories.map(
                          (category) => category.subCategories.isEmpty
                              ? ListTile(
                                  leading: SvgPicture.asset(
                                    'assets/svg/${category.name}.svg',
                                    height: 25,
                                    color: AppColors.primaryColor,
                                  ),
                                  title: Text(category.displayName),
                                  onTap: () {
                                    Get.to(
                                      () => NewsView(
                                        category: category,
                                        newsListType: NewsListType.regular,
                                      ),
                                    );
                                  },
                                )
                              : ExpansionTile(
                                  title: Text(category.displayName),
                                  leading: SvgPicture.asset(
                                    'assets/svg/${category.name}.svg',
                                    height: 25,
                                  ),
                                  children: category.subCategories
                                      .map((subCategory) => ListTile(
                                            leading: subCategory.hasIcon
                                                ? SvgPicture.asset(
                                                    'assets/svg/${subCategory.name}.svg',
                                                    height: 25,
                                                    width: 25,
                                                    color:
                                                        AppColors.primaryColor,
                                                  )
                                                : null,
                                            title:
                                                Text(subCategory.displayName),
                                            onTap: () {
                                              Get.to(
                                                () => NewsView(
                                                  category: subCategory,
                                                  isSubCategory: true,
                                                  newsListType:
                                                      NewsListType.regular,
                                                ),
                                              );
                                            },
                                          ))
                                      .toList(),
                                ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Powered By"),
                        Image.asset('assets/images/prixa_image.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
