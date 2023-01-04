import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomGetUtils {
  CustomGetUtils._();
  static Future<void> getBottomSheet({required Widget child}) {
    return Get.bottomSheet(
        SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 3,
                  width: Get.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.5),
                    color: Theme.of(Get.context!).colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              child
            ],
          ),
        ),
        barrierColor: Colors.grey.withOpacity(0.6),
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        backgroundColor: Theme.of(Get.context!).colorScheme.surface,
        isScrollControlled: true,
        ignoreSafeArea: true);
  }
}
