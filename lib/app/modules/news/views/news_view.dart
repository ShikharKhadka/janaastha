import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jana_aastha/app/model/author_model.dart';
import 'package:jana_aastha/utils/category_enums.dart';
import 'package:jana_aastha/app/modules/news/controllers/news_controller.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:jana_aastha/widgets/large_vertical_news_card.dart';
import 'package:jana_aastha/widgets/small_vertical_news_card.dart';

enum NewsListType { regular, alternate }

class NewsView extends StatelessWidget {
  final CategoryTabs category;
  final AuthorResult? author;
  final bool isSubCategory;
  final NewsListType newsListType;
  const NewsView({
    Key? key,
    required this.category,
    this.author,
    required this.newsListType,
    this.isSubCategory = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: Get.put(
          NewsController(
            category: category,
            author: author,
          ),
          tag: category.name,
        ),
        tag: category.name,
        builder: (controller) {
          return Scaffold(
            appBar: category.forExplore || isSubCategory
                ? AppBar(
                    title: Text(category.nepaliNames),
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
                  )
                : category == CategoryTabs.author && author != null
                    ? AppBar(
                        title: Text(author!.name ?? ""),
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
                      )
                    : null,
            body: Obx(
              () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : controller.newsList.isNotEmpty
                      ? RefreshIndicator(
                          onRefresh: controller.onRefresh,
                          child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: controller.newsList.length,
                            itemBuilder: (context, index) {
                              // int nextIndex = index;
                              // int secondIndex = index;
                              log(newsListType.toString());

                              return newsListType == NewsListType.regular
                                  ? LargeVerticalNewsCard(
                                      newsResult: controller.newsList[index],
                                    )
                                  : index % 2 == 0
                                      ? LargeVerticalNewsCard(
                                          newsResult:
                                              controller.newsList[index],
                                        )
                                      : index != controller.newsList.length - 1
                                          ? Row(
                                              children:
                                                  // List.generate(
                                                  //   2,
                                                  //   (i) => Expanded(
                                                  //     child: SmallVerticalNewsCard(
                                                  //       newsResult:
                                                  //           controller.newsList[i],
                                                  //     ),
                                                  //   ),
                                                  // )
                                                  [
                                                Expanded(
                                                  child: SmallVerticalNewsCard(
                                                    newsResult: controller
                                                        .newsList[index],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SmallVerticalNewsCard(
                                                    newsResult: controller
                                                        .newsList[index],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : LargeVerticalNewsCard(
                                              newsResult:
                                                  controller.newsList[index],
                                            );
                            },
                          ),
                        )
                      : Center(
                          child: Text('Something went wrong'),
                        ),
            ),
          );
        });
  }
}
