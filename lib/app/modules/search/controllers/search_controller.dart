import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jana_aastha/app/modules/news/controllers/news_controller.dart';
import 'package:jana_aastha/utils/category_enums.dart';

class SearchController extends GetxController {
  late final TextEditingController searchEditingController;
  late final NewsController newsController;
  final FocusNode searchFocus = FocusNode();
  @override
  void onInit() {
    searchEditingController = TextEditingController();
    newsController = Get.put(NewsController(
      category: CategoryTabs.search,
    ));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void clearSearch() {
    searchEditingController.text = '';
    newsController.reset();
    newsController.update();
    if (searchEditingController.text != '') {
      search(searchEditingController.text);
    }
  }

  void searchText() async {
    if (searchEditingController.text != '') {
      await newsController.getNews();
    }
  }

  void dismissKeyboard() {
    if (searchFocus.hasFocus) {
      searchFocus.unfocus();
    }
  }

  Future<void> search(String value) async {
    newsController.reset();
    newsController.searchText = value;

    await newsController.getNews();
  }
}
