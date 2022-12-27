import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:nepali_utils/nepali_utils.dart';

import '../controllers/e_paper_controller.dart';

class EPaperView extends GetView<EPaperController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.whiteColor,
            )),
        title: Text(
          "${NepaliUnicode.convert(NepaliDateFormat("d MMMM y, EEE").format(NepaliDateTime.parse(DateTime.now().toString())))}",
          style: appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Center(
        child: Text(
          'EPaperView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
