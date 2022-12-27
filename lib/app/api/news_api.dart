import 'dart:convert';
import 'dart:developer';

import 'package:jana_aastha/app/endpoints/endpoints.dart';
import 'package:jana_aastha/app/model/news.dart';
import 'package:http/http.dart' as http;
import 'package:jana_aastha/app/model/news_model.dart';
import 'package:jana_aastha/utils/global_url.dart';

class NewsApi {
  Future<dynamic> getNews({required String endpoint}) async {
    try {
      String url = "$endpoint";
      log(":::::::::::::::::::$url::::::::::::::::::::::");
      var response = await http.get(Uri.parse(url));
      log("Respone:::::::${response.statusCode} ");
      if (response.statusCode == 200) {
        var body = jsonDecode(utf8.decode(response.bodyBytes));
        return News.fromJson(body);
      } else {
        return false;
      }
    } catch (e) {
      print("Error:::::::::: $e");
      return null;
    }
  }
}

class NewsApi2 {
  Future<dynamic> getNews({required String endpoint}) async {
    try {
      String url = "$endpoint";
      log(":::::::::::::::::::$url::::::::::::::::::::::");
      var response = await http.get(Uri.parse(url));
      log("Respone:::::::${response.statusCode} ");
      if (response.statusCode == 200) {
        // var body = jsonDecode(utf8.decode(response.bodyBytes));

        var body =
            NewsModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        // log(body.toString());
        return body;
      }
    } catch (e) {
      print("Error:::::::::: $e");
      return null;
    }
  }
}

class NewsApi3 {
  Future<dynamic> getNews(
      {int page = 0,
      required String querypara,
      required String endpoints}) async {
    try {
      String url = "${EndPoints.baseUrl}$endpoints/$querypara?page=$page";
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
      return null;
    }
  }
}
