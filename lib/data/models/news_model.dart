class ArticleModel {
  final String title;
  final String description;
  final String imageUrl;

  ArticleModel(this.title, this.description, this.imageUrl);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      json['title'],
      json['description'],
      json['urlToImage'],
    );
  }
}
