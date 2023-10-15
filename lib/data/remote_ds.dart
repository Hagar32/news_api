import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_api/data/models/news_model.dart';
abstract class NewsDataSource {
  Future<ArticleModel> fetchRandomArticle();
}

class NewsDataSourceImpl implements NewsDataSource {
  @override
  Future<ArticleModel> fetchRandomArticle() async {
    Response response = await get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2023-09-15&sortBy=publishedAt&apiKey=2bf84ac7aa724984b1124cc5a3510f20'));

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      final articles = jsonMap['articles'];

      return ArticleModel.fromJson(articles[0]);
    } else {
      throw Exception('Failed to fetch article');
    }
  }
}