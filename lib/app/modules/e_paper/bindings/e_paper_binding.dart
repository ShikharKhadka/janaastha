import 'package:get/get.dart';

import '../controllers/e_paper_controller.dart';

class EPaperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EPaperController>(
      () => EPaperController(),
    );
  }
}
