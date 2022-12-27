import 'package:get/get.dart';

import '../controllers/network_service_controller.dart';

class NetworkServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkServiceController>(
      () => NetworkServiceController(),
    );
  }
}
