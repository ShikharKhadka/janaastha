import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jana_aastha/app/modules/custom_drawer/views/custom_drawer_view.dart';
import 'package:jana_aastha/app/modules/network_service/controllers/network_service_controller.dart';
import 'package:jana_aastha/app/modules/network_service/views/network_service_view.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:jana_aastha/widgets/large_horizontal_news_card.dart';
import 'package:jana_aastha/widgets/large_vertical_news_card.dart';
import 'package:jana_aastha/widgets/small_vertical_news_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final _controller = Get.put(HomeController());
  final _networkServiceController = Get.put(NetworkServiceController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: _networkServiceController.connectionType.value == 0
            ? NetworkServiceView()
            : Scaffold(
                body: _controller.loading.value == true
                    ? Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : RefreshIndicator(
                        onRefresh: () {
                          return Future.delayed(Duration(seconds: 2), () {
                            _controller.refresh();
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5.r),
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: _controller.newsList.length,
                              itemBuilder: (context, index) {
                                //pagination(new data get fetched when scrolled to page end)
                                if (index ==
                                    (_controller.newsList.length - 1)) {
                                  if (index != (_controller.news!.count! - 1)) {
                                    _controller.getNews();
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.r),
                                      child: Center(
                                          child: CircularProgressIndicator
                                              .adaptive()),
                                    );
                                  } else {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20.r),
                                      child: Text(
                                        "No news to display",
                                        textAlign: TextAlign.center,
                                        style: authorStyle,
                                      ),
                                    );
                                  }
                                }
                                //
                                int e = 0;
                                e = (index / 3).round();
                                //incase if there is only one data to be viewed in row of two data
                                if (index ==
                                        (_controller.newsList.length - 1) &&
                                    (index % 3) != 0 &&
                                    (_controller.newsList.length % 3) != 0) {
                                  //to preview large vertical news card
                                  if (e.isEven || e == 0) {
                                    switch (index % 3) {
                                      case 0:
                                        return LargeVerticalNewsCard(
                                          newsResult:
                                              _controller.newsList[index],
                                          imageUrl: _controller
                                              .newsList[index].status!,
                                        );
                                      case 1:
                                        return Row(
                                          children: [
                                            Expanded(
                                                child: SmallVerticalNewsCard(
                                              newsResult:
                                                  _controller.newsList[index],
                                              imageUrl: _controller
                                                  .newsList[index].titlePhoto!,
                                            )),
                                            Expanded(child: SizedBox()),
                                          ],
                                        );
                                      case 2:
                                        return SizedBox();
                                      default:
                                        return const SizedBox(
                                          height: 0,
                                        );
                                    }
                                  }
                                  //to preview large horizontal news card
                                  else {
                                    switch (index % 3) {
                                      case 0:
                                        return LargeHorizontalNewsCard(
                                          newsResult:
                                              _controller.newsList[index],
                                          imageUrl: _controller
                                              .newsList[index].titlePhoto!,
                                        );
                                      case 1:
                                        return Row(
                                          children: [
                                            Expanded(
                                                child: SmallVerticalNewsCard(
                                              newsResult:
                                                  _controller.newsList[index],
                                              imageUrl: _controller
                                                  .newsList[index].titlePhoto!,
                                            )),
                                            Expanded(child: SizedBox()),
                                          ],
                                        );
                                      case 2:
                                        return SizedBox();

                                      default:
                                        return const SizedBox(
                                          height: 0,
                                        );
                                    }
                                  }
                                }
                                //incase if there is two data to be viewed in row of two data
                                else {
                                  //to preview large vertical news card
                                  if (e.isEven || e == 0) {
                                    switch (index % 3) {
                                      case 0:
                                        return LargeVerticalNewsCard(
                                          newsResult:
                                              _controller.newsList[index],
                                          imageUrl: _controller
                                              .newsList[index].status!,
                                        );
                                      case 1:
                                        return SizedBox();
                                      case 2:
                                        return Row(
                                          children: [
                                            Expanded(
                                                child: SmallVerticalNewsCard(
                                              newsResult:
                                                  _controller.newsList[index],
                                              imageUrl: _controller
                                                  .newsList[index].status!,
                                            )),
                                            Expanded(
                                                child: SmallVerticalNewsCard(
                                              newsResult:
                                                  _controller.newsList[index],
                                              imageUrl: _controller
                                                  .newsList[index].status!,
                                            )),
                                          ],
                                        );

                                      default:
                                        return const SizedBox(
                                          height: 0,
                                        );
                                    }
                                  }
                                  //to preview large horizontal news card
                                  else {
                                    switch (index % 3) {
                                      case 0:
                                        return LargeHorizontalNewsCard(
                                          newsResult:
                                              _controller.newsList[index],
                                          imageUrl: _controller
                                              .newsList[index].status!,
                                        );
                                      case 1:
                                        return SizedBox();
                                      case 2:
                                        return Row(
                                          children: [
                                            Expanded(
                                                child: SmallVerticalNewsCard(
                                              newsResult:
                                                  _controller.newsList[index],
                                              imageUrl: _controller
                                                  .newsList[index].status!,
                                            )),
                                            Expanded(
                                                child: SmallVerticalNewsCard(
                                              newsResult:
                                                  _controller.newsList[index],
                                              imageUrl: _controller
                                                  .newsList[index].status!,
                                            )),
                                          ],
                                        );

                                      default:
                                        return const SizedBox(
                                          height: 0,
                                        );
                                    }
                                  }
                                }
                              }),
                        ),
                      ),
              ),
      ),
    );
  }
}
