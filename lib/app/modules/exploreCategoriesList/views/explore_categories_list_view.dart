import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/app/endpoints/endpoints.dart';
import 'package:jana_aastha/app/modules/explore/controllers/explore_controller.dart';
import 'package:jana_aastha/app/modules/news/views/news_view.dart';

class ExploreCategoriesListView extends StatelessWidget {
  const ExploreCategoriesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('प्रदेश'),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: controller.exploreCaterogoriesList.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () async {
                    String para = controller.endponitsList[index];
                    controller.querypara = para;
                    String endpoints = EndPoints.news;
                    log(para);
                    await controller.getNews(para, endpoints);
                    Get.to(() => NewsView(
                          newsList: controller.newsList,
                          label: controller.categoriesList[index].label,
                        ));
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Card(
                      margin: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          controller.exploreCaterogoriesList[index],
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                );
              })),
        );
      },
    );
  }
}
