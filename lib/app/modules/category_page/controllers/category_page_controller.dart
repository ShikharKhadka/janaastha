import 'dart:developer';

import 'package:get/get.dart';
import 'package:jana_aastha/app/api/news_api.dart';
import 'package:jana_aastha/app/endpoints/endpoints.dart';
import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/utils/global_url.dart';

class CategoryPageController extends GetxController {
  NewsModel? news;
  bool? isLoading;
  int nextPage = 0;
  List<Post> newsList = [];
  late String querypara;
  late String endpoints;
  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    var argsEndpoints = (args['endpoints']);
    var argsQuery = (args['query']);
    endpoints = argsEndpoints;
    querypara = argsQuery;
    getNews();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getNews() async {
    if (endpoints == '/get_recent_news/') {
      var news = await NewsApi2().getNews(endpoint: "${GlobalUrl.recentpost}");
      if (news != null) {
        newsList.addAll(news!.posts!);
        nextPage += 1;
        print("this is from page ${newsList.length}");
        update();
      }
    } else {
      news = await NewsApi3()
          .getNews(page: nextPage, querypara: querypara, endpoints: endpoints);
      if (news != null) {
        newsList.addAll(news!.posts!);
        nextPage += 1;
        print("this is from page ${newsList.length}");
        update();
      }
    }
  }
}
