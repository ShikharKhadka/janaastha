import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:pdfx/pdfx.dart';

import '../controllers/epaper_controller.dart';

class EpaperView extends GetView<EpaperController> {
  const EpaperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title:
            Text(controller.pdfFile != null ? controller.pdfFile!.title : ""),
        centerTitle: true,
      ),
      body: controller.pdfcontroller != null
          ? Stack(
              children: [
                PdfViewPinch(
                  controller: controller.pdfcontroller!,
                  builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
                    options: DefaultBuilderOptions(
                      loaderSwitchDuration: const Duration(seconds: 1),
                    ),
                    documentLoaderBuilder: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    pageLoaderBuilder: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    errorBuilder: (_, error) =>
                        Center(child: Text(error.toString())),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 16,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: PdfPageNumber(
                      controller: controller.pdfcontroller!,
                      builder: (_, state, currentPage, pagesCount) => Container(
                        alignment: Alignment.center,
                        child: Text(
                          '$currentPage',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        topLeft: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Text("Something went wrong"),
            ),
    );
  }
}
