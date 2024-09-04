import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsdata.io/api/1/latest?apikey=pub_526193d1ab018ff4db7d3417ee1e0f0365ef0&country=au,us&category=$category');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["results"];

      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            image: article['image_url'],
            title: article['title'],
            subTitle: article['description']);
        articlesList.add(articleModel);
      }
      return articlesList;
    } on DioException catch (dioError) {
      // التعامل مع استثناءات Dio
      print('Dio error: ${dioError.message}');
      return [];
    } catch (e) {
      // التعامل مع استثناءات عامة أخرى
      print('Unexpected error: $e');
      return [];
    }
  }
}
