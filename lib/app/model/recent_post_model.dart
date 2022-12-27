// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    NewsModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    int? count;
    String? next;
    dynamic previous;
    List<Result>? results;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.titleNepali,
        this.slug,
        this.newsType,
        this.subtitleNepali,
        this.showHighlight,
        this.highlightTitle,
        this.highlightBody,
        this.bodyNepali,
        this.summary,
        this.eventDate,
        this.eventPlaceNepali,
        this.titlePhoto,
        this.videoEmbedCode,
        this.titlePhotoCaption,
        this.showPhotoOnBreaking,
        this.isApproved,
        this.isDraft,
        this.isPublished,
        this.isPushed,
        this.publishedAt,
        this.sentForApprovalAt,
        this.pdfUpload,
        this.lastUpdated,
        this.viewCount,
        this.createdAt,
        this.modifiedAt,
        this.deletedAt,
        this.user,
        this.category,
        this.location,
        this.album,
        this.titlePhotoObj,
        this.author,
        this.actualAuthor,
        this.secondaryCategory,
        this.tags,
    });

    int? id;
    String? titleNepali;
    String? slug;
    int? newsType;
    String? subtitleNepali;
    bool? showHighlight;
    dynamic highlightTitle;
    dynamic highlightBody;
    String? bodyNepali;
    String? summary;
    String? eventDate;
    dynamic eventPlaceNepali;
    String? titlePhoto;
    dynamic videoEmbedCode;
    dynamic titlePhotoCaption;
    bool? showPhotoOnBreaking;
    bool? isApproved;
    bool? isDraft;
    bool? isPublished;
    bool? isPushed;
    DateTime? publishedAt;
    dynamic sentForApprovalAt;
    dynamic pdfUpload;
    dynamic lastUpdated;
    int? viewCount;
    DateTime? createdAt;
    DateTime? modifiedAt;
    dynamic deletedAt;
    int? user;
    int? category;
    int? location;
    dynamic album;
    dynamic titlePhotoObj;
    int? author;
    dynamic actualAuthor;
    List<dynamic>? secondaryCategory;
    List<dynamic>? tags;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        titleNepali: json["title_nepali"],
        slug: json["slug"],
        newsType: json["news_type"],
        subtitleNepali: json["subtitle_nepali"],
        showHighlight: json["show_highlight"],
        highlightTitle: json["highlight_title"],
        highlightBody: json["highlight_body"],
        bodyNepali: json["body_nepali"],
        summary: json["summary"],
        eventDate: json["event_date"],
        eventPlaceNepali: json["event_place_nepali"],
        titlePhoto: json["title_photo"],
        videoEmbedCode: json["video_embed_code"],
        titlePhotoCaption: json["title_photo_caption"],
        showPhotoOnBreaking: json["show_photo_on_breaking"],
        isApproved: json["is_approved"],
        isDraft: json["is_draft"],
        isPublished: json["is_published"],
        isPushed: json["is_pushed"],
        publishedAt: DateTime.parse(json["published_at"]),
        sentForApprovalAt: json["sent_for_approval_at"],
        pdfUpload: json["pdf_upload"],
        lastUpdated: json["last_updated"],
        viewCount: json["view_count"],
        createdAt: DateTime.parse(json["created_at"]),
        modifiedAt: DateTime.parse(json["modified_at"]),
        deletedAt: json["deleted_at"],
        user: json["user"],
        category: json["category"],
        location: json["location"],
        album: json["album"],
        titlePhotoObj: json["title_photo_obj"],
        author: json["author"],
        actualAuthor: json["actual_author"],
        secondaryCategory: List<dynamic>.from(json["secondary_category"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title_nepali": titleNepali,
        "slug": slug,
        "news_type": newsType,
        "subtitle_nepali": subtitleNepali,
        "show_highlight": showHighlight,
        "highlight_title": highlightTitle,
        "highlight_body": highlightBody,
        "body_nepali": bodyNepali,
        "summary": summary,
        "event_date": eventDate,
        "event_place_nepali": eventPlaceNepali,
        "title_photo": titlePhoto,
        "video_embed_code": videoEmbedCode,
        "title_photo_caption": titlePhotoCaption,
        "show_photo_on_breaking": showPhotoOnBreaking,
        "is_approved": isApproved,
        "is_draft": isDraft,
        "is_published": isPublished,
        "is_pushed": isPushed,
        "published_at": publishedAt!.toIso8601String(),
        "sent_for_approval_at": sentForApprovalAt,
        "pdf_upload": pdfUpload,
        "last_updated": lastUpdated,
        "view_count": viewCount,
        "created_at": createdAt!.toIso8601String(),
        "modified_at": modifiedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "user": user,
        "category": category,
        "location": location,
        "album": album,
        "title_photo_obj": titlePhotoObj,
        "author": author,
        "actual_author": actualAuthor,
        "secondary_category": List<dynamic>.from(secondaryCategory!.map((x) => x)),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
    };
}
