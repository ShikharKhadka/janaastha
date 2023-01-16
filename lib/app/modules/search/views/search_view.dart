import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/app/modules/news/views/news_view.dart';
import 'package:jana_aastha/utils/category_enums.dart';
import 'package:jana_aastha/utils/constants.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: Get.put(SearchController()),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  focusNode: controller.searchFocus,
                  controller: controller.searchEditingController,
                  onSubmitted: controller.search,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        color: AppColors.primaryColor,
                        onPressed: controller.searchText,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        color: AppColors.primaryColor,
                        onPressed: controller.clearSearch,
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          body: GestureDetector(
            onTap: controller.dismissKeyboard,
            child: NewsView(
              category: CategoryTabs.search,
              newsListType: NewsListType.regular,
              controller: controller.newsController,
            ),
          ),
        );
      },
    );
  }
}
