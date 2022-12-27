import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/utils/constants.dart';

import '../controllers/network_service_controller.dart';

class NetworkServiceView extends GetView<NetworkServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset('assets/lottie/disconnect.gif'),
          SizedBox(
            height: 10.r,
          ),
          Text("Please Check Your Internet Connection")
        ],
      )),
    );
  }
}
