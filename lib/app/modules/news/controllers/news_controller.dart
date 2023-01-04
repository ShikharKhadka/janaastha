import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jana_aastha/app/api/news_api.dart';
import 'package:jana_aastha/app/endpoints/endpoints.dart';
import 'package:jana_aastha/app/model/author_model.dart';
import 'package:jana_aastha/utils/category_enums.dart';
import 'package:jana_aastha/app/model/news_model.dart';

class NewsController extends GetxController {
  late ScrollController scrollController;
  final CategoryTabs category;
  final AuthorResult? author;
  List<Post> newsList = [];
  final isLoading = false.obs;
  final isFetchingNextPage = false.obs;
  int currentPage = 0;

  NewsController({
    required this.category,
    this.author,
  });
  @override
  void onInit() async {
    super.onInit();
    scrollController = ScrollController()..addListener(_scrollListener);
    await getNews();
  }

  void _scrollListener() async {
    if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent &&
            !isFetchingNextPage.value
        // &&
        // category != CategoryTabs.recent
        ) {
      currentPage += 1;
      await getNews(page: currentPage, isFirstCall: false);
    }
  }

  Future<void> getNews({int page = 0, bool isFirstCall = true}) async {
    try {
      isLoading(isFirstCall);
      if (!isFirstCall) {
        isFetchingNextPage(true);
      }
      String queryString = '?page=$page';
      String path = '';
      if (category == CategoryTabs.author && author != null) {
        path = '${EndPoints.author_news}/${author!.id}';
      } else {
        path = EndPoints.news;
        if (category != CategoryTabs.home) {
          queryString += '&cat=${category.slug}';
        }
      }
      final newsResponse = await NewsApi3().getNews(
        queryString: queryString,
        path: path,
      );
      if (newsResponse != null) {
        newsList.addAll(newsResponse.posts.toSet().toList());
        isLoading(false);
        isFetchingNextPage(false);
        update();
      } else {
        isLoading(true);
      }
    } catch (_) {
      isLoading(true);
      isFetchingNextPage(true);
      Get.snackbar('Error', 'No internet connection');
    }
  }

  Future<void> onRefresh() async {
    newsList = [];
    currentPage = 0;
    getNews();
  }
}
