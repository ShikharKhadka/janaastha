import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/app/modules/explore/controllers/explore_controller.dart';
import 'package:jana_aastha/widgets/large_vertical_news_card.dart';

class NewsView extends StatelessWidget {
  final String label;

  final List<Post> newsList;
  // final List<String> authorEndPointsList;
  // String endpoints;

  const NewsView({Key? key, required this.label, required this.newsList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  controller.newsList.clear();
                  controller.update();
                  controller.nextPage = 0;
                  controller.update();
                  controller.querypara = '';
                  controller.update();
                  controller.endpoints = '';
                  controller.update();
                  Navigator.of(context).pop();
                }),
            title: Text(label),
            centerTitle: true,
          ),
          body: ListView(
            controller: controller.scrollController,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.newsList.length,
                  itemBuilder: (context, index) {
                    print(controller.newsList[index].author);
                    return GestureDetector(
                      onTap: () {
                        // print(newsList.author);
                      },
                      child: LargeVerticalNewsCard(
                        newsResult: newsList[index],
                        imageUrl: newsList[index].status!,
                      ),
                    );
                  }),
            ],
          ));
    });
  }
}
