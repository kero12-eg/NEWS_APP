import 'dart:convert';

ArticleModel ArticleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String ArticleModelToJson(ArticleModel data) =>
    json.encode(data.toJson());

class ArticleModel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  ArticleModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      ArticleModel(
        status: json["status"]?.toString(),
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"].map((x) => Article.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"]?.toString(),
        title: json["title"]?.toString(),
        description: json["description"]?.toString(),
        url: json["url"]?.toString(),
        urlToImage: json["urlToImage"]?.toString(),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.tryParse(json["publishedAt"].toString()),
        content: json["content"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"]?.toString(),
        name: json["name"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}