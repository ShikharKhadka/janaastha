// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final epaperModel = epaperModelFromJson(jsonString);

import 'dart:convert';



class EpaperModel {
  EpaperModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<Epaper> results;

  factory EpaperModel.fromJson(Map<String, dynamic> json) => EpaperModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Epaper>.from(json["results"].map((x) => Epaper.fromJson(x))),
      );
  factory EpaperModel.fromRawJson(String str) =>
      EpaperModel.fromJson(json.decode(str));
}

class Epaper {
  Epaper({
    required this.id,
    required this.createdAt,
    required this.lastModified,
    required this.deletedAt,
    required this.summary,
    required this.publishedAt,
    required this.thumbnail,
    required this.file,
  });

  final int id;
  final DateTime createdAt;
  final DateTime lastModified;
  final dynamic deletedAt;
  final dynamic summary;
  final DateTime publishedAt;
  final dynamic thumbnail;
  final String file;

  factory Epaper.fromJson(Map<String, dynamic> json) => Epaper(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        lastModified: DateTime.parse(json["last_modified"]),
        deletedAt: json["deleted_at"],
        summary: json["summary"],
        publishedAt: DateTime.parse(json["published_at"]),
        thumbnail: json["thumbnail"],
        file: json["file"],
      );
}

class PdfFile {
  final String url;
  final String title;

  PdfFile({
    required this.url,
    required this.title,
  });
}
