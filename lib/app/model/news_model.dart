// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

class NewsModel {
  NewsModel({
    required this.status,
    required this.count,
    required this.countTotal,
    required this.posts,
  });

  String status;
  int count;
  int countTotal;
  List<Post> posts;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "count_total": countTotal,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class Post {
  Post(
      {required this.id,
      required this.type,
      required this.typeTitle,
      required this.slug,
      required this.url,
      required this.status,
      required this.title,
      required this.titlePlain,
      this.titlePhoto,
      this.titlePhotoSmallThumb,
      this.titlePhotoMediumThumb,
      required this.shortDesc,
      required this.content,
      required this.dateNepali,
      required this.modified,
      required this.timesince,
      required this.author,
      required this.authorUrl,
      required this.pdf});

  int id;
  String type;
  String typeTitle;
  String slug;
  String url;
  String status;
  String title;
  String titlePlain;
  String? titlePhoto;
  String? titlePhotoSmallThumb;
  String? titlePhotoMediumThumb;
  String shortDesc;
  String content;
  String dateNepali;
  String modified;
  String timesince;
  String author;
  String authorUrl;
  String? pdf;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json["id"],
      type: json["type"],
      typeTitle: json["type_title"],
      slug: json["slug"],
      url: json["url"],
      status: json["status"],
      title: json["title"],
      titlePlain: json["title_plain"],
      titlePhoto: json["title_photo"],
      titlePhotoSmallThumb: json["title_photo_small_thumb"],
      titlePhotoMediumThumb: json["title_photo_medium_thumb"],
      shortDesc: json["short_desc"],
      content: json["content"],
      dateNepali: json["date_nepali"],
      modified: (json["modified"]),
      timesince: json["timesince"],
      author: json["author"],
      authorUrl: json["author_url"],
      pdf: json["pdf"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "type_title": typeTitle,
        "slug": slug,
        "url": url,
        "status": status,
        "title": title,
        "title_plain": titlePlain,
        "title_photo": titlePhoto,
        "title_photo_small_thumb": titlePhotoSmallThumb,
        "title_photo_medium_thumb": titlePhotoMediumThumb,
        "short_desc": shortDesc,
        "content": content,
        "date_nepali": dateNepali,
        "modified": modified,
        "timesince": timesince,
        "author": author,
        "author_url": authorUrl,
      };
}
