import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:jana_aastha/app/model/epaper_model.dart';
import 'package:pdfx/pdfx.dart';

class EpaperController extends GetxController {
  PdfControllerPinch? pdfcontroller;
  PdfFile? pdfFile;
  @override
  void onInit() async {
    pdfFile = Get.arguments["pdf"];
    if (pdfFile != null) {
      pdfcontroller = PdfControllerPinch(
        document: PdfDocument.openData(
          InternetFile.get(pdfFile!.url),
        ),
      );
    }

    super.onInit();
  }
}
