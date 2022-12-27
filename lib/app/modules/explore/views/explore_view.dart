import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/app/endpoints/endpoints.dart';
import 'package:jana_aastha/app/modules/exploreCategoriesList/views/explore_categories_list_view.dart';
import 'package:jana_aastha/app/modules/news/views/news_view.dart';
import 'package:jana_aastha/utils/constants.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
        init: ExploreController(),
        builder: (controller) {
          return Scaffold(
            body: ListView(
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
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 4),
                      shrinkWrap: true,
                      itemCount: controller.categoriesList.length,
                      itemBuilder: (context, index) {
                        final catagory = controller.categoriesList[index];
                        return Column(
                          children: [
                            SizedBox(
                              height: 0,
                            ),
                            IconButton(
                              icon: Icon(
                                catagory.iconData,
                                size: 30,
                                color: AppColors.primaryColor,
                              ),
                              color: catagory.color,
                              onPressed: () async {
                                String para = controller.endponitsList[index];
                                controller.querypara = para;
                                String endpoints = EndPoints.news;
                                log(para);
                                if (para == '7' || para == '10') {
                                  log(para);
                                  Get.to(() => ExploreCategoriesListView());
                                } else {
                                  await controller.getNews(para, endpoints);

                                  Get.to(() => NewsView(
                                        newsList: controller.newsList,
                                        label: controller
                                            .categoriesList[index].label,
                                      ));
                                }
                              },
                            ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            Text(catagory.label, style: normalStylewithBold),
                          ],
                        );
                      }),
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
                      children:
                          List.generate(controller.authorList.length, (index) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: GestureDetector(
                            onTap: () async {
                              String para =
                                  controller.authorEndponitsList[index];
                              controller.querypara = para;
                              String endpoints = EndPoints.author_news;
                              await controller.getNews(para, endpoints);
                              Get.to(() => NewsView(
                                    newsList: controller.newsList,
                                    label:
                                        controller.categoriesList[index].label,
                                  ));
                            },
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        controller.authorList[index].photo!),
                                  ),
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
          );
        });
  }
}
