import 'package:get/get.dart';
import 'package:jana_aastha/app/api/author_api.dart';
import 'package:jana_aastha/app/model/author_model.dart';
import 'package:jana_aastha/utils/category_enums.dart';

class ExploreController extends GetxController {
  List<AuthorResult> authorList = [];
  late List<CategoryTabs> categories;

  AuthorModel? author;
  final isLoading = false.obs;
  @override
  void onInit() async {
    categories =
        CategoryTabs.values.where((element) => element.forExplore).toList();
    super.onInit();
    await getAuthor();
  }

  Future<void> getAuthor() async {
    isLoading(true);
    author = await AuthorApi().getAuthor();
    if (author != null) {
      isLoading(false);
      authorList.addAll(author!.results!);
      print("this is from page ${authorList.length}");
      update();
    } else {
      isLoading(true);
    }
  }
}
