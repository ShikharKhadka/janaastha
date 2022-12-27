import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:jana_aastha/app/model/author_model.dart';
import 'package:jana_aastha/utils/global_url.dart';

class AuthorApi {
  Future<dynamic> getNews() async {
    try {
      String url = "${GlobalUrl.author}";
      log(":::::::::::::::::::$url::::::::::::::::::::::");
      var response = await http.get(Uri.parse(url));
      log("Respone:::::::${response.statusCode} ");
      if (response.statusCode == 200) {
        // var body = jsonDecode(utf8.decode(response.bodyBytes));

        var body =
            AuthorModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        print(body.results![0].name!);
        return body;
      }
    } catch (e) {
      print("Error:::::::::: $e");
      return null;
    }
  }
}
