import 'package:get/get.dart';

import '../controllers/e_paper_list_controller.dart';

class EPaperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EPaperListController>(
      () => EPaperListController(),
    );
  }
}
