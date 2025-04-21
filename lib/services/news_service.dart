import 'package:dio/dio.dart';
import 'package:news/models/article_model.dart';

class NewsServices {
  // contains dio methods for the services of the project
  final Dio dio;
  // Dio return data as jason data automatically not as text data
  NewsServices({required this.dio});

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=4f3bb507b63a41d394807c4a5aefdfa9&category=$category');

      Map<String, dynamic> jsonData =
          response.data; // Your data type is usually Map or List
      // Map<String,dynamic>  we get this from the api link.
      // convert map to object***********
      // the important is the articals list of the map so
      List<dynamic> articles = jsonData[
          'articles']; // this is list of maps (difficult to work with it)
      List<ArticleModel> articleList =
          []; // the better is list of object from class

      // each article on articals is map and i want from each map some data(image , title , subtitle) so i need an object for this:
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);

        articleList.add(articleModel);
      }
      return articleList;
    } on Exception catch (e) {
      return [];
    }
  }
}
