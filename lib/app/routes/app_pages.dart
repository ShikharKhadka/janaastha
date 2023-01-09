import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/e_paper_list/bindings/e_paper_binding.dart';
import '../modules/e_paper_list/views/e_paper_list_view.dart';
import '../modules/epaper/bindings/epaper_binding.dart';
import '../modules/epaper/views/epaper_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/network_service/bindings/network_service_binding.dart';
import '../modules/network_service/views/network_service_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.E_PAPER,
      page: () => EPaperListView(),
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
      name: _Paths.EPAPER,
      page: () => const EpaperView(),
      binding: EpaperBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
