import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jana_aastha/app/endpoints/endpoints.dart';
import 'package:jana_aastha/app/modules/category_page/views/category_page_view.dart';
import 'package:jana_aastha/utils/constants.dart';
import 'package:jana_aastha/widgets/list_tile.dart';

import '../controllers/custom_drawer_controller.dart';

class CustomDrawerView extends GetView<CustomDrawerController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r),
              child: Image.asset(
                'assets/images/logo1.png',
                height: 50.r,
              ),
            ),
            decoration: BoxDecoration(color: AppColors.primaryColor),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('समाचार'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.timelapse),
            title: const Text('Recent Post'),
            onTap: () {
              Get.to(
                  () => CategoryPageView(
                        title: "Recent Post",
                      ),
                  arguments: {
                    'endpoints': EndPoints.get_recent_news,
                  });
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports),
            title: const Text('खेलकुद'),
            onTap: () {
              Get.to(
                  () => CategoryPageView(
                        title: "Sports",
                      ),
                  arguments: {'endpoints': EndPoints.news, 'query': '1/'});
            },
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('अर्थ'),
            onTap: () {
              Get.to(
                  () => CategoryPageView(
                        title: "Economy",
                      ),
                  arguments: {'endpoints': EndPoints.news, 'query': '1/'});
            },
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('विशेष'),
            onTap: () {
              Get.to(
                  () => CategoryPageView(
                        title: "Economy",
                      ),
                  arguments: {'endpoints': EndPoints.news, 'query': '1/'});
            },
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('विचार'),
            onTap: () {
              Get.to(
                  () => CategoryPageView(
                        title: "Economy",
                      ),
                  arguments: {'endpoints': EndPoints.news, 'query': '1/'});
            },
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('अन्तर्वार्ता'),
            onTap: () {
              Get.to(
                  () => CategoryPageView(
                        title: "Economy",
                      ),
                  arguments: {'endpoints': EndPoints.news, 'query': '1/'});
            },
          ),
          ExpansionTile(
              leading: const Icon(Icons.money),
              title: const Text('प्रदेश'),
              children: [
                ListTile(
                  leading: const Icon(Icons.flag),
                  title: const Text('प्रदेश-१'),
                  onTap: () {
                    Get.to(
                        () => CategoryPageView(
                              title: "Economy",
                            ),
                        arguments: {
                          'endpoints': EndPoints.news,
                          'query': '1/'
                        });
                  },
                ),
                ListTileView(
                    leading: const Icon(Icons.flag),
                    onTap: () {
                      Get.to(
                          () => CategoryPageView(
                                title: "Economy",
                              ),
                          arguments: {
                            'endpoints': EndPoints.news,
                            'query': '1/'
                          });
                    },
                    title: const Text('प्रदेश-२')),
                ListTileView(
                    leading: const Icon(Icons.flag),
                    onTap: () {
                      Get.to(
                          () => CategoryPageView(
                                title: "Economy",
                              ),
                          arguments: {
                            'endpoints': EndPoints.news,
                            'query': '1/'
                          });
                    },
                    title: const Text('बागमती')),
                ListTileView(
                    leading: const Icon(Icons.flag),
                    onTap: () {
                      Get.to(
                          () => CategoryPageView(
                                title: "Economy",
                              ),
                          arguments: {
                            'endpoints': EndPoints.news,
                            'query': '1/'
                          });
                    },
                    title: const Text('गण्डकी')),
                ListTileView(
                    leading: const Icon(Icons.flag),
                    onTap: () {
                      Get.to(
                          () => CategoryPageView(
                                title: "Economy",
                              ),
                          arguments: {
                            'endpoints': EndPoints.news,
                            'query': '1/'
                          });
                    },
                    title: const Text('लुम्बिनी')),
                ListTileView(
                    leading: const Icon(Icons.flag),
                    onTap: () {
                      Get.to(
                          () => CategoryPageView(
                                title: "Economy",
                              ),
                          arguments: {
                            'endpoints': EndPoints.news,
                            'query': '1/'
                          });
                    },
                    title: const Text('कर्णाली')),
                ListTileView(
                    leading: const Icon(Icons.flag),
                    onTap: () {
                      Get.to(() => CategoryPageView(
                            title: "Economy",
                          ));
                    },
                    title: const Text('सुदूरपश्चिम'))
              ]),
          ListTileView(
              leading: const Icon(Icons.flag),
              onTap: () {
                Get.to(
                    () => CategoryPageView(
                          title: "Economy",
                        ),
                    arguments: {'endpoints': EndPoints.news, 'query': '1/'});
              },
              title: const Text('मनोरञ्जन')),
          ListTileView(
              leading: const Icon(Icons.flag),
              onTap: () {
                Get.to(
                    () => CategoryPageView(
                          title: "Economy",
                        ),
                    arguments: {'endpoints': EndPoints.news, 'query': '1/'});
              },
              title: const Text('स्वास्थ्य')),
          ListTileView(
              leading: const Icon(Icons.flag),
              onTap: () {
                Get.to(
                    () => CategoryPageView(
                          title: "Economy",
                        ),
                    arguments: {'endpoints': EndPoints.news, 'query': '1/'});
              },
              title: const Text('लेख रचना'))
        ],
      ),
    );
  }
}
