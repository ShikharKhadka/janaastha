import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/app/modules/news_detail/views/news_detail_view.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jana_aastha/utils/string_extenion.dart';

class LargeVerticalNewsCard extends StatelessWidget {
  final Post newsResult;
  const LargeVerticalNewsCard({
    Key? key,
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
          padding: EdgeInsets.all(8.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 160.h,
              width: Get.width,
              child: CachedNetworkImage(
                imageUrl: newsResult.titlePhoto ?? "",
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
            Text(
              newsResult.title,
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
                                  newsResult.dateNepali.parseToNepaliDateTime!,
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
                  maxLines: 4,
                  textOverflow: TextOverflow.ellipsis,
                )
              },
            ),
          ]),
        ),
      ),
    );
  }
}
