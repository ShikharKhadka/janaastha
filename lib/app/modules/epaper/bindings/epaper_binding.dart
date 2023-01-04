import 'package:get/get.dart';

import '../controllers/epaper_controller.dart';

class EpaperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EpaperController>(
      () => EpaperController(),
    );
  }
}
