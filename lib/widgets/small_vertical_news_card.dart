import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/app/modules/news_detail/views/news_detail_view.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:nepali_utils/nepali_utils.dart';

class SmallVerticalNewsCard extends StatelessWidget {
  final String imageUrl;
  // title, shortDesc, dateNepali, author;
  // final Post news;
  final Post newsResult;
  const SmallVerticalNewsCard({
    Key? key,
    required this.imageUrl,
    // required this.title,
    // required this.shortDesc,
    // required this.dateNepali,
    // required this.author,
    required this.newsResult,
    // required this.news
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => NewsDetailView(
            news: newsResult,
          )),
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 120.h,
              width: Get.width,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsResult.title!,
                      style: titleStyle1,
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
                                    newsResult.author!,
                                    textAlign: TextAlign.left,
                                    style: authorStyle,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          width: 10.r,
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
                                    newsResult.modified!,
                                    // "${NepaliDateFormat("d MMMM y, EEE").format(NepaliDateTime.parse(newsResult.modified!.toString()))}",
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
                    //       "53 Minutes Ago | CA",
                    //       textAlign: TextAlign.left,
                    //       style: authorStyle,
                    //     ),
                    //     Spacer(),
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
                      height: 3.h,
                    ),
                    // Text(
                    //   shortDesc,
                    //   style: subtitleStyle,
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 4,
                    // ),
                    Html(
                      data: newsResult.shortDesc!,
                      style: {
                        "#": Style(
                          fontSize: FontSize(15.sp),
                          maxLines: 5,
                          textOverflow: TextOverflow.ellipsis,
                        )
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.video_call,
                          color: AppColors.greyColor,
                        ),
                        Icon(
                          Icons.link,
                          color: AppColors.greyColor,
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: AppColors.greyColor,
                        ),
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
