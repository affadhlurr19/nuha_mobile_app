import 'dart:convert';

DetailArticle? detailArticleFromJson(String str) => DetailArticle.fromJson(json.decode(str));

String detailArticleToJson(DetailArticle? data) => json.encode(data!.toJson());

class DetailArticle {
    DetailArticle({
        this.code,
        this.message,
        this.founded,
        this.article,
    });

    int? code;
    String? message;
    int? founded;
    Article? article;

    factory DetailArticle.fromJson(Map<String, dynamic> json) => DetailArticle(
        code: json["code"],
        message: json["message"],
        founded: json["founded"],
        article: Article.fromJson(json["article"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "founded": founded,
        "article": article!.toJson(),
    };
}

class Article {
    Article({
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

    factory Article.fromJson(Map<String, dynamic> json) => Article(
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
