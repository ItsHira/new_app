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
        var data = NewsApiModel.fromJson(articles);

        return data.articles!;
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
