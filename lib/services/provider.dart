import 'package:dio/dio.dart';
import 'package:news_api_app/model/news_api_model.dart';
// import 'package: tesla_news_app/model/ tesla_news_model.dart';

// class NewsProvider {
//   static final _client = Dio();

//   static Future<List<T>> getArticle<T>(String endpoint, T Function(Map<String, dynamic>) fromJson) async {
//     try {
//       final response = await _client.get(endpoint);

//       if (response.statusCode == 200) {
//         final articlesData = response.data as Map<String, dynamic>;
//         var articlesModel = fromJson(articlesData);

//         return articlesModel.articles??[]; // Handle potential null articles list
//       } else {
//        throw Exception('Failed to fetch articals');
//       }
//     } catch (e) {
//      throw Exception(e.toString());
//     }
//   }
// }

class NewsProvider {
  static final _client = Dio();
  static Future<List<Articles>> getArticle(String endpoint) async {
    try {
      final res = await _client.get(endpoint);

      if (res.statusCode == 200) {
        final articles = res.data as Map<String, dynamic>;
        var data = NewsApiModel.fromJson(articles);
        print(res);
        return data.articles!;
      } else {
        throw Exception('Failed to fetch articals');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
