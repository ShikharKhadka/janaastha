import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/app/modules/news_detail/views/news_detail_view.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:jana_aastha/utils/string_extenion.dart';

class LargeHorizontalNewsCard extends StatelessWidget {
  // final String imageUrl, title, shortDesc, author;
  // final String? imageUrl;
  // final Post news;
  final Post newsResult;
  const LargeHorizontalNewsCard({
    Key? key,
    // this.imageUrl =
    //     'https://thahacdn.prixacdn.net/media/albums/shapath_12_n9f8PxA3jC.jpg',
    // required this.title,
    // required this.shortDesc,
    // this.dateNepali,
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
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        newsResult.title,
                        style: titleStyle1,
                        maxLines: 2,
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
                                      newsResult.author,
                                      textAlign: TextAlign.left,
                                      style: authorStyle,
                                    ),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10.r,
                          ),
                          newsResult.dateNepali.parseToNepaliDateTime != null
                              ? SizedBox(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                            newsResult.dateNepali
                                                .parseToNepaliDateTime!,
                                            textAlign: TextAlign.left,
                                            style: authorStyle,
                                          ),
                                        ),
                                      ]),
                                )
                              : Container()
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Html(
                        data: newsResult.shortDesc,
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.r,
                ),
                Flexible(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180.h,
                        width: Get.width,
                        child: CachedNetworkImage(
                          imageUrl: newsResult.titlePhoto!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(Icons.nearby_error),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
