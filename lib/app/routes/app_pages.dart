import 'package:get/get.dart';

import '../modules/category_page/bindings/category_page_binding.dart';
import '../modules/category_page/views/category_page_view.dart';
import '../modules/custom_drawer/bindings/custom_drawer_binding.dart';
import '../modules/custom_drawer/views/custom_drawer_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/e_paper/bindings/e_paper_binding.dart';
import '../modules/e_paper/views/e_paper_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/exploreCategoriesList/bindings/explore_categories_list_binding.dart';
import '../modules/exploreCategoriesList/views/explore_categories_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/network_service/bindings/network_service_binding.dart';
import '../modules/network_service/views/network_service_view.dart';
import '../modules/news_detail/bindings/news_detail_binding.dart';
import '../modules/news_detail/views/news_detail_view.dart';
import '../modules/recent_news/bindings/recent_news_binding.dart';
import '../modules/recent_news/views/recent_news_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOM_DRAWER,
      page: () => CustomDrawerView(),
      binding: CustomDrawerBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAIL,
      page: () => NewsDetailView(),
      binding: NewsDetailBinding(),
    ),
    // GetPage(
    //   name: _Paths.NEWS_PAGE,
    //   page: () => NewsPageView(
    //     path: "",
    //   ),
    //   binding: NewsPageBinding(),
    // ),
    GetPage(
      name: _Paths.CATEGORY_PAGE,
      page: () => CategoryPageView(
        title: '',
      ),
      binding: CategoryPageBinding(),
    ),
    GetPage(
      name: _Paths.E_PAPER,
      page: () => EPaperView(),
      binding: EPaperBinding(),
    ),
    GetPage(
      name: _Paths.NETWORK_SERVICE,
      page: () => NetworkServiceView(),
      binding: NetworkServiceBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: _Paths.EXPLORE,
      page: () => const ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.RECENT_NEWS,
      page: () => RecentNewsView(),
      binding: RecentNewsBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE_CATEGORIES_LIST,
      page: () => const ExploreCategoriesListView(),
      binding: ExploreCategoriesListBinding(),
    ),
  ];
}
