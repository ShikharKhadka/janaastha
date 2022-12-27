import 'package:get/get.dart';
import 'package:jana_aastha/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:jana_aastha/app/modules/dashboard/views/dashboard_view.dart';
import 'package:jana_aastha/app/modules/home/views/home_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    nextScreen();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  nextScreen() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Get.off(
        () => DashboardView(),
        binding: DashboardBinding(),
      );
    });
  }

  @override
  void onClose() {}
}
