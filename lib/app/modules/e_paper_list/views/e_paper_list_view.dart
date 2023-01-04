import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/utils/constants.dart';

import '../controllers/e_paper_list_controller.dart';
import 'package:jana_aastha/app/routes/app_pages.dart';

class EPaperListView extends GetView<EPaperListController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EPaperListController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
          ),
          body: Obx(
            (() => controller.isLoading.value
                ? Center(child: CircularProgressIndicator.adaptive())
                : controller.epaperList.isNotEmpty
                    ? GridView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.epaperList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (() {
                              Get.toNamed(Routes.EPAPER, arguments: {
                                "ePaper": controller.epaperList[index]
                              });
                            }),
                            child: Card(
                              elevation: 0.2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Image.asset(
                                      'assets/images/logo1.png',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(controller.epaperList[index].publishedAt
                                      .toString())
                                ],
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: Text("Something went wrong"),
                      )),
          ),
          // floatingActionButton: Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     FloatingActionButton(
          //       heroTag: "previousFloating",
          //       backgroundColor:
          //           controller.hasPreviousEpaper && !controller.isChangingEpaper
          //               ? AppColors.primaryColor
          //               : Colors.grey,
          //       child: Icon(Icons.arrow_back),
          //       mini: true,
          //       tooltip: "Previous Epaper",
          //       onPressed:
          //           controller.hasPreviousEpaper && !controller.isChangingEpaper
          //               ? controller.goToPreviousEpaper
          //               : null,
          //     ),
          //     FloatingActionButton(
          //       heroTag: "nextFloating",
          //       backgroundColor:
          //           controller.hasNextEpaper && !controller.isChangingEpaper
          //               ? AppColors.primaryColor
          //               : Colors.grey,
          //       child: Icon(Icons.arrow_forward),
          //       mini: true,
          //       tooltip: "Next Epaper",
          //       onPressed:
          //           controller.hasNextEpaper && !controller.isChangingEpaper
          //               ? controller.goToNextEpaper
          //               : null,
          //     )
          //   ],
          // ),
        );
      },
    );
  }
}
