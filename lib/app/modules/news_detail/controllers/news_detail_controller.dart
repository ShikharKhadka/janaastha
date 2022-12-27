import 'dart:developer';
import 'package:get/get.dart';

class NewsDetailController extends GetxController {
  var characterSize = 16.00.obs;
  @override
  void onInit() {
    log(characterSize.value.toString());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  changecharacterSize({required bool increaseSize}) {
    double minLimit = 15.00;
    double maxLimit = 25.00;
    //if want to increase font size
    if (increaseSize == true) {
      //if font size is between min and max limit it can be increased
      if (minLimit < characterSize.value &&
          characterSize.value < maxLimit &&
          characterSize.value != maxLimit - 1) {
        characterSize.value = characterSize.value + 1;
        log("::::::::::::increase::::::::: ${characterSize.value}");
      } else {
        log("cant increase");
      }
    }
    //if want to decrease font size
    else {
      //if font is between min and max limit it can be decreased
      if (minLimit < characterSize.value &&
          characterSize.value < maxLimit &&
          characterSize.value != minLimit + 1) {
        characterSize.value = characterSize.value - 1;
        log("::::::::::::decrease::::::::: ${characterSize.value}");
      }
    }
  }

  @override
  void onClose() {}
}
