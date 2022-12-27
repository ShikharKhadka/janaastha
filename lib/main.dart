import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/app/modules/network_service/bindings/network_service_binding.dart';
import 'package:nepali_utils/nepali_utils.dart';

import 'app/routes/app_pages.dart';

void main() {
  NepaliUtils(Language.nepali);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        initialBinding: NetworkServiceBinding(),
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return MediaQuery(
            ///Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget as Widget,
          );
        },
      ),
    );
  }
}
