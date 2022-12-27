import 'dart:developer';

import 'package:get/get.dart';
import 'package:jana_aastha/app/api/news_api.dart';
import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/utils/global_url.dart';

class RecentNewsController extends GetxController {
  //TODO: Implement RecentNewsController

  RxBool loading = false.obs;
  NewsModel? news;
  List<Post> newsList = <Post>[].obs;
  var page = 0.obs;
  @override
  void onInit() async {
    loading.value = true;
    page.value = 0;
    await getNews();
    loading.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future getNews() async {
    var res = await NewsApi2().getNews(endpoint: "${GlobalUrl.recentpost}");
    if (res == null) {
      Get.snackbar(
          "Error", "Internal Server Error. Please Try again later!...");
    } else if (res == false) {
      Future.delayed(
          Duration(
            seconds: 6,
          ),
          () => getNews());
    } else {
      news = res;
      newsList.addAll(news!.posts!);
      //after fetching news increasing the page no for pagination(to fetch news from next page)
      page.value = page.value + 1;
      log("News Fetched Successfully::::::::::");
    }
  }

  refresh() async {
    page.value = 0;
    newsList.clear();
    await getNews();
  }

  @override
  void onClose() {}
}
