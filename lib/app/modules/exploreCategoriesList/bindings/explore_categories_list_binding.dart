import 'package:get/get.dart';

import '../controllers/explore_categories_list_controller.dart';

class ExploreCategoriesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreCategoriesListController>(
      () => ExploreCategoriesListController(),
    );
  }
}
