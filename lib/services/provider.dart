import 'package:dio/dio.dart';
import 'package:news_api_app/model/news_api_model.dart';

import '../model/model_function.dart';

class NewsProvider {
  static final _client = Dio();
  static Future<List<Articles>> getArticle(String endpoint) async {
    try {
      final res = await _client.get(endpoint);

      if (res.statusCode == 200) {
        final articles = res.data as Map<String, dynamic>;
        print('error');
        final data = NewsApiModel.fromMap(articles);
        print('error');
        final newslist = data.articles;
        print('error');

        return newslist;
      } else {
        throw Exception('Failed to fetch articals');
      }
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}
