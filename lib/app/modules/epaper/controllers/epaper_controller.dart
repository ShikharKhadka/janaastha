import 'dart:ui';

import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:jana_aastha/app/model/epaper_model.dart';
import 'package:pdfx/pdfx.dart';

class EpaperController extends GetxController {
  PdfControllerPinch? pdfcontroller;
  Epaper? epaper;
  @override
  void onInit() async {
    epaper = Get.arguments["ePaper"];
    if (epaper != null) {
      pdfcontroller = PdfControllerPinch(
        document: PdfDocument.openData(
          InternetFile.get(epaper!.file),
        ),
      );
    }

    super.onInit();
  }
}
