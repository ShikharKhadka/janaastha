import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:nepali_utils/nepali_utils.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  final Post? news;
  NewsDetailView({
    Key? key,
    this.news,
  }) : super(key: key);
  final _controller = Get.put(NewsDetailController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
              child: ListView(
                padding: EdgeInsets.all(8.h),
                children: [
                  Text(
                    news!.title!,
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
                      imageUrl: news!.status!,
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
                                  news!.titlePhoto!,
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
                                  "${NepaliUnicode.convert(NepaliDateFormat("d MMMM y, EEE").format(NepaliDateTime.parse(news!.modified.toString())))}",
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
                        onPressed: () => _controller.changecharacterSize(
                            increaseSize: false),
                        child: Text(
                          "- A",
                          style:
                              titleStyle1.copyWith(color: AppColors.whiteColor),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor, elevation: 3),
                      ),
                      SizedBox(
                        width: 10.r,
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            _controller.changecharacterSize(increaseSize: true),
                        child: Text(
                          "A +",
                          style:
                              titleStyle1.copyWith(color: AppColors.whiteColor),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor, elevation: 3),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.r,
                  ),
                  SelectableHtml(
                    data: news!.shortDesc!,
                    style: {
                      "p": Style(
                        fontSize: FontSize(_controller.characterSize.value),
                        after: "\n",
                      )
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
