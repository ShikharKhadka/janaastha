// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);
class News {
  News({
    this.status,
    this.count,
    this.countTotal,
    this.posts,
  });

  String? status;
  int? count;
  int? countTotal;
  List<Post>? posts;

  factory News.fromJson(Map<String, dynamic> json) => News(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );
}

class Post {
  Post({
    this.id,
    this.type,
    this.typeTitle,
    this.slug,
    this.url,
    this.status,
    this.title,
    this.titlePlain,
    this.titlePhoto,
    this.titlePhotoSmallThumb,
    this.titlePhotoMediumThumb,
    this.shortDesc,
    this.content,
    this.dateNepali,
    this.modified,
    this.timesince,
    this.author,
    this.authorUrl,
  });

  int? id;
  String? type;
  String? typeTitle;
  String? slug;
  String? url;
  String? status;
  String? title;
  String? titlePlain;
  String? titlePhoto;
  String? titlePhotoSmallThumb;
  String? titlePhotoMediumThumb;
  String? shortDesc;
  String? content;
  DateTime? dateNepali;
  DateTime? modified;
  String? timesince;
  String? author;
  String? authorUrl;

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
        dateNepali: DateTime.parse(json["date_nepali"]),
        modified: DateTime.parse(json["modified"]),
        timesince: json["timesince"],
        author: json["author"],
        authorUrl: json["author_url"],
      );
}
