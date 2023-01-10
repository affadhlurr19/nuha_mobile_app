import 'dart:convert';

SearchArticle? searchArticleFromJson(String str) => SearchArticle.fromJson(json.decode(str));

String searchArticleToJson(SearchArticle? data) => json.encode(data!.toJson());

class SearchArticle {
    SearchArticle({
        this.code,
        this.message,
        this.founded,
        this.article,
    });

    int? code;
    String? message;
    int? founded;
    List<Articles?>? article;

    factory SearchArticle.fromJson(Map<String, dynamic> json) => SearchArticle(
        code: json["code"],
        message: json["message"],
        founded: json["founded"],
        article: List<Articles>.from(json["article"]!.map((x) => Articles.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "founded": founded,
        "article": article == null ? [] : List<dynamic>.from(article!.map((x) => x!.toJson())),
    };
}

class Articles {
    Articles({
        this.id,
        this.title,
        this.category,
        this.content,
        this.imageUrl,
        this.author,
        this.readTime,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? title;
    String? category;
    String? content;
    String? imageUrl;
    String? author;
    int? readTime;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        content: json["content"],
        imageUrl: json["image_url"],
        author: json["author"],
        readTime: json["read_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "content": content,
        "image_url": imageUrl,
        "author": author,
        "read_time": readTime,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
