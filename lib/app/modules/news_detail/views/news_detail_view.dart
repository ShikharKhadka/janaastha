import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/app/model/epaper_model.dart';

import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/app/routes/app_pages.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:pdfx/pdfx.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends StatelessWidget {
  final Post news;
  NewsDetailView({
    Key? key,
    required this.news,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsDetailController>(
      init: Get.put(NewsDetailController(pdfUrl: news.pdf)),
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: Image.asset(
                'assets/images/logo1.png',
                height: 35.r,
              ),
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
              leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.whiteColor,
                    )),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(5.r),
              child: Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        news.title,
                        style: titleStyle1,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 160.h,
                        width: Get.width,
                        child: CachedNetworkImage(
                          imageUrl: news.titlePhoto ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Wrap(
                        children: [
                          SizedBox(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: AppColors.iconColor,
                                    size: 15.r,
                                  ),
                                  SizedBox(
                                    width: 5.r,
                                  ),
                                  Flexible(
                                    child: Text(
                                      news.title,
                                      textAlign: TextAlign.left,
                                      style: authorStyle,
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 5.r,
                          ),
                          SizedBox(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: AppColors.iconColor,
                                    size: 15.r,
                                  ),
                                  SizedBox(
                                    width: 5.r,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${NepaliUnicode.convert(NepaliDateFormat("d MMMM y, EEE").format(NepaliDateTime.parse(news.modified.toString())))}",
                                      textAlign: TextAlign.left,
                                      style: authorStyle,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "${news!.timesince} | ${news!.author}",
                      //       textAlign: TextAlign.left,
                      //       style: authorStyle,
                      //     ),
                      //     Spacer(),
                      //     Icon(
                      //       Icons.video_call,
                      //       color: AppColors.greyColor,
                      //     ),
                      //     Icon(
                      //       Icons.link,
                      //       color: AppColors.greyColor,
                      //     ),
                      //     Icon(
                      //       Icons.more_horiz,
                      //       color: AppColors.greyColor,
                      //     ),
                      //     Icon(
                      //       Icons.bookmark,
                      //       color: AppColors.greyColor,
                      //     ),
                      //   ],
                      // ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5.r,
                      ),
                      // Text(
                      //   news!.content!,
                      //   style: subtitleStyle,
                      // ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => controller.changecharacterSize(
                                increaseSize: false),
                            child: Text(
                              "- A",
                              style: titleStyle1.copyWith(
                                  color: AppColors.whiteColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                elevation: 3),
                          ),
                          SizedBox(
                            width: 10.r,
                          ),
                          ElevatedButton(
                            onPressed: () => controller.changecharacterSize(
                                increaseSize: true),
                            child: Text(
                              "A +",
                              style: titleStyle1.copyWith(
                                  color: AppColors.whiteColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                elevation: 3),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Share.share(news.url);
                              },
                              icon: Icon(
                                Icons.share,
                                color: AppColors.primaryColor,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 5.r,
                      ),
                      Obx(() => Html(
                            data: news.content,
                            onImageTap: (url, ctx, attributes, element) {
                              if (url != null) {
                                final imageProvider =
                                    CachedNetworkImageProvider(url);
                                showImageViewer(
                                  context,
                                  imageProvider,
                                  doubleTapZoomable: true,
                                  swipeDismissible: true,
                                );
                              }
                            },
                            style: {
                              "p": Style(
                                fontSize: FontSize.rem(
                                    controller.characterSize.value),
                                after: "\n",
                              ),
                              "span": Style(
                                fontSize: FontSize.rem(
                                    controller.characterSize.value),
                                lineHeight: LineHeight(1.5),
                              )
                            },
                          )),
                      SizedBox(
                        height: 5.h,
                      ),
                      controller.pdfcontroller != null &&
                              controller.pdfUrl != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.EPAPER, arguments: {
                                    "pdf": PdfFile(
                                      title: "",
                                      url: controller.pdfUrl!,
                                    )
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: PdfView(
                                          controller: controller.pdfcontroller!,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 2,
                                        child: Icon(
                                          Icons.file_open,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 54,
                        // color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
