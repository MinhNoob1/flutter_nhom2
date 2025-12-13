class News {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  News({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ??
          "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
      content: json["content"] ?? "",
    );
  }
}
