import 'dart:convert';
import 'dart:developer';

import 'package:jana_aastha/app/endpoints/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:jana_aastha/app/model/news_model.dart';

class NewsApi3 {
  Future<NewsModel?> getNews({
    int page = 0,
    required String queryString,
    required String path,
  }) async {
    try {
      String url = "${EndPoints.baseUrl}$path/$queryString";
      log(":::::::::::::::::::$url::::::::::::::::::::::");
      var response = await http.get(
        Uri.parse(url),
      );
      log("Respone:::::::${response.statusCode} ");
      if (response.statusCode == 200) {
        var body =
            NewsModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return body;
      }
    } catch (e) {
      print("Error:::::::::: $e");
      throw e.toString();
    }
  }
}
