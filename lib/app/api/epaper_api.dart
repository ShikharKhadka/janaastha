import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:jana_aastha/app/endpoints/endpoints.dart';
import 'package:jana_aastha/app/model/epaper_model.dart';

class EpaperApi {
  Future<EpaperModel?> getEpapers(
      {int page = 1, }) async {
    try {
      String url = "${EndPoints.baseUrl}${EndPoints.epaper}/?page=$page";
      log(":::::::::::::::::::$url::::::::::::::::::::::");
      var response = await http.get(Uri.parse(url));
      log("Respone:::::::${response.statusCode} ");
      if (response.statusCode == 200) {
        // var body = jsonDecode(utf8.decode(response.bodyBytes));

        var body = EpaperModel.fromRawJson(response.body);
        return body;
      } else {
        return null;
      }
    } catch (e) {
      print("Error:::::::::: $e");
      return null;
    }
  }
}
