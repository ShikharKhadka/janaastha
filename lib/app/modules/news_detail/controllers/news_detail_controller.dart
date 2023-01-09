import 'dart:developer';
import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class NewsDetailController extends GetxController {
  var characterSize = 1.5.obs;
  final String? pdfUrl;

  PdfController? pdfcontroller;

  NewsDetailController({required this.pdfUrl});
  @override
  void onInit() {
    log(characterSize.value.toString());
    if (pdfUrl != null) {
      pdfcontroller = PdfController(
        document: PdfDocument.openData(
          InternetFile.get(pdfUrl!),
        ),
      );
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  changecharacterSize({required bool increaseSize}) {
    double minLimit = 1.2;
    double maxLimit = 2.5;
    //if want to increase font size
    if (increaseSize == true) {
      //if font size is between min and max limit it can be increased
      if (characterSize.value < maxLimit) {
        characterSize.value = characterSize.value + 0.1;
        log("::::::::::::increase::::::::: ${characterSize.value}");
      } else {
        log("cant increase");
      }
    }
    //if want to decrease font size
    else {
      //if font is between min and max limit it can be decreased
      if (minLimit < characterSize.value) {
        characterSize.value = characterSize.value - 0.1;
        log("::::::::::::decrease::::::::: ${characterSize.value}");
      }
    }
  }

  @override
  void onClose() {}
}
