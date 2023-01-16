import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/utils/custom_get_utils.dart';
import 'package:jana_aastha/app/modules/news/views/news_view.dart';
import 'package:jana_aastha/utils/constants.dart';

import '../controllers/explore_controller.dart';
import 'package:jana_aastha/utils/category_enums.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
        init: Get.put(ExploreController()),
        builder: (controller) {
          return Scaffold(
              body: Obx(
            () => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Explore Categories',
                          style: headingStylewithBold,
                        ),
                      ),
                      Card(
                        elevation: 0.2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 4),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.categories.length,
                              itemBuilder: (context, index) {
                                final category = controller.categories[index];
                                return GestureDetector(
                                  onTap: () async {
                                    if (category.subCategories.isNotEmpty) {
                                      CustomGetUtils.getBottomSheet(
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          itemCount:
                                              category.subCategories.length,
                                          itemBuilder: (context, index) {
                                            final subCategory =
                                                category.subCategories[index];
                                            return ListTile(
                                                leading: subCategory.hasIcon
                                                    ? SvgPicture.asset(
                                                        'assets/svg/${subCategory.name}.svg',
                                                        height: 30,
                                                        width: 30,
                                                        color: AppColors
                                                            .primaryColor,
                                                      )
                                                    : null,
                                                title: Text(
                                                    subCategory.displayName),
                                                onTap: (() {
                                                  Get.to(() => NewsView(
                                                      category: subCategory,
                                                      isSubCategory: true,
                                                      newsListType: NewsListType
                                                          .regular));
                                                }));
                                          },
                                          separatorBuilder: (context, index) {
                                            return const Divider();
                                          },
                                        ),
                                      );
                                    } else {
                                      Get.to(() => NewsView(
                                            category: category,
                                            newsListType: NewsListType.regular,
                                          ));
                                    }
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: SvgPicture.asset(
                                          'assets/svg/${category.name}.svg',
                                          height: 30,
                                          width: 30,
                                          color:
                                              category != CategoryTabs.pradesh
                                                  ? AppColors.primaryColor
                                                  : null,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(category.displayName,
                                            style: normalStylewithBold),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Explore Authors',
                          style: headingStylewithBold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: List.generate(
                                controller.authorList.length, (index) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: GestureDetector(
                                  onTap: () async {
                                    // log(" hello${controller.categories[index].slug}");
                                    Get.to(
                                      () => NewsView(
                                        category: CategoryTabs.author,
                                        author: controller.authorList[index],
                                        newsListType: NewsListType.regular,
                                      ),
                                    );
                                  },
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        controller.authorList[index].photo !=
                                                null
                                            ? CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    AppColors.primaryColor,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                  controller
                                                      .authorList[index].photo!,
                                                ),
                                              )
                                            : Container(),
                                        Text(
                                          controller.authorList[index].name!,
                                          textAlign: TextAlign.center,
                                          style: normalStylewithBold,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
          ));
        });
  }
}
