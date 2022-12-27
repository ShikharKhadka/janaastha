import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jana_aastha/app/api/author_api.dart';
import 'package:jana_aastha/app/api/news_api.dart';
import 'package:jana_aastha/app/model/author_model.dart';
import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/utils/global_url.dart';

class ExploreController extends GetxController {
  List<Post> newsList = [];
  List<AuthorResult> authorList = [];
  ScrollController scrollController = ScrollController();
  late String querypara;
  late String endpoints;
  bool firstCall = false;
  int nextPage = 0;
  List<Categories> categoriesList = [
    Categories(
      iconData: Icons.newspaper,
      label: "समाचार",
    ),
    Categories(
      iconData: Icons.read_more,
      label: "राजनीति",
    ),
    Categories(iconData: Icons.abc, label: "अर्थ"),
    Categories(
      iconData: Icons.abc,
      label: "लेख रचना",
    ),
    Categories(
      iconData: Icons.sports_cricket,
      label: "खेलकुद",
    ),
    Categories(
      iconData: Icons.health_and_safety,
      label: "स्वास्थ्य",
    ),
    Categories(
      iconData: CupertinoIcons.flag,
      label: "प्रदेश",
    ),
    Categories(
      iconData: Icons.abc,
      label: "मल्टिमिडिया",
    ),
    Categories(
      iconData: Icons.abc,
      label: "अन्तर्वार्ता",
    ),
    Categories(
      iconData: Icons.tv_rounded,
      label: "मल्टिमिडिया",
    ),
  ];
  List<String> endponitsList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  List<String> authorEndponitsList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  List<String> exploreCaterogoriesList= ['प्रदेश-१','प्रदेश-२','बागमती','गण्डकी','लुम्बिनी','कर्णाली','सुदूरपश्चिम'];
  AuthorModel? author;
  NewsModel? news;
  bool? isLoading;
  @override
  void onInit() {
    super.onInit();
    getAuthor();

    if (!firstCall) {
      print('Scroll controlling working');
      scrollController.addListener(() {
        scrollView();
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  scrollView() async {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      await getNews(querypara, endpoints);
      update();
    }
  }

  getNews(String queryparameters, String endpoints) async {
    news = await NewsApi3().getNews(
        page: nextPage, querypara: queryparameters, endpoints: endpoints);
    if (news != null) {
      firstCall = true;
      newsList.addAll(news!.posts!);
      nextPage += 1;
      print("this is from page ${newsList.length}");
      update();
    }
  }

  getAuthor() async {
    isLoading = true;
    author = await AuthorApi().getNews();
    if (author != null) {
      isLoading = false;
      authorList.addAll(author!.results!);
      print("this is from page ${authorList.length}");
      update();
    } else {
      isLoading = true;
    }
  }

  // nextPagegetNews(String endpoints, int nextpage) async {
  //   nextPage;
  //   news = await NewsApi3().getNews(endpoint: endpoints);
  //   if (news != null) {
  //     newsList.addAll(news!.posts!);
  //     nextPage += 1;
  //     print("this is from next page ${newsList.length}");
  //     update();
  //   }
  // }
}

class Categories {
  final IconData iconData;
  final String label;
  final VoidCallback? onTap;
  final Color color;

  Categories(
      {required this.iconData,
      required this.label,
      this.onTap,
      this.color = Colors.black});
}
