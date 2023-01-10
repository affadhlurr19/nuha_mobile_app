class ArticleResult {
  ArticleResult({
    this.code,
    this.message,
    this.article,
  });

  int? code;
  String? message;
  List<Article>? article;

  factory ArticleResult.fromJson(Map<String, dynamic> json) => ArticleResult(
        code: json["code"],
        message: json["message"],
        article: List<Article>.from(
            json["article"]!.map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "article": article == null
            ? []
            : List<dynamic>.from(article!.map((x) => x!.toJson())),
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
