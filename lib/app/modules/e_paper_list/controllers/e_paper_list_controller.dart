import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jana_aastha/app/api/epaper_api.dart';
import 'package:jana_aastha/app/model/epaper_model.dart';
import 'package:pdfx/pdfx.dart';

class EPaperListController extends GetxController {
  RxBool isLoading = false.obs;
  PdfControllerPinch? pdfcontroller;
  RxInt currentEpaper = 0.obs;
  bool isChangingEpaper = false;
  List<Epaper> epaperList = [];
  late ScrollController scrollController;
  int currentPage = 1;
  @override
  void onInit() async {
    await getEpaper();
    scrollController = ScrollController()..addListener(_scrollListener);
    super.onInit();
  }

  void _scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      currentPage += 1;
      await getEpaper(page: currentPage, firstcall: false);
    }
  }

  Future<void> getEpaper({int page = 1, bool firstcall = true}) async {
    try {
      isLoading(firstcall);
      final epaperModel = await EpaperApi().getEpapers(page: currentPage);
      if (epaperModel != null) {
        if (epaperModel.results.isNotEmpty) {
          epaperList.addAll(epaperModel.results);
        }
      }
      isLoading(false);
      update();
    } catch (e) {
      isLoading(false);
    }
  }

  // bool get hasNextEpaper {
  //   return pdfcontroller != null && currentEpaper.value < epaperList.length - 1;
  // }

  // bool get hasPreviousEpaper {
  //   return pdfcontroller != null && currentEpaper.value > 0;
  // }

  // void goToNextEpaper() async {
  //   if (hasNextEpaper) {
  //     currentEpaper++;
  //     await loadCurrentEpaper();
  //   }
  // }

  // void goToPreviousEpaper() async {
  //   if (hasPreviousEpaper) {
  //     currentEpaper--;
  //     await loadCurrentEpaper();
  //   }
  // }

  // Future<void> loadCurrentEpaper() async {
  //   isChangingEpaper = true;
  //   update();
  //   await pdfcontroller!.loadDocument(PdfDocument.openData(
  //       InternetFile.get(epaperList[currentEpaper.value].file)));
  //   isChangingEpaper = false;
  //   update();
  //   WidgetsBinding.instance.addPostFrameCallback(
  //       (_) => pdfcontroller!.animateToPage(pageNumber: 1));
  // }
}
