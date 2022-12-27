// To parse this JSON data, do
//
//     final authorModel = authorModelFromJson(jsonString);



class AuthorModel {
    AuthorModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    int? count;
    String? next;
    dynamic previous;
    List<AuthorResult>? results;

    factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<AuthorResult>.from(json["results"].map((x) => AuthorResult.fromJson(x))),
    );
}

class AuthorResult {
    AuthorResult({
        this.id,
        this.name,
        this.description,
        this.photo,
        this.priority,
        this.displayAuthorBiline,
        this.displayAuthorBlock,
        this.showHyperlink,
        this.createdAt,
        this.modifiedAt,
        this.deletedAt,
    });

    int? id;
    String? name;
    String? description;
    String? photo;
    int? priority;
    bool? displayAuthorBiline;
    bool? displayAuthorBlock;
    bool? showHyperlink;
    DateTime? createdAt;
    DateTime? modifiedAt;
    dynamic deletedAt;

    factory AuthorResult.fromJson(Map<String, dynamic> json) => AuthorResult(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        photo: json["photo"],
        priority: json["priority"],
        displayAuthorBiline: json["display_author_biline"],
        displayAuthorBlock: json["display_author_block"],
        showHyperlink: json["show_hyperlink"],
        createdAt: DateTime.parse(json["created_at"]),
        modifiedAt: DateTime.parse(json["modified_at"]),
        deletedAt: json["deleted_at"],
    );
}
