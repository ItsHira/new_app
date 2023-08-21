import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/news_api_model.dart';
import '../services/provider.dart';



class ProviderFuntion with ChangeNotifier {
  List<Articles>? _newsArticle;
  List<Articles>? get artical => _newsArticle;
  bool isloading = false;

  void getData(String endpoint) async {
    final data = await NewsProvider.getArticle(endpoint);
    _newsArticle = data;
    _newsArticle != null ? isloading = true : isloading = false;
    notifyListeners();
  }
}