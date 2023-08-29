import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/news_api_model.dart';
import '../screens/widgets/data_function.dart';
import '../services/api_service.dart';
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

  static ProviderFuntion s(BuildContext context) =>
      Provider.of<ProviderFuntion>(context, listen: true);

  int selectedTabIndex = 0;

  void changeTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  Widget cardDataProvider(int selectedTabIndex) {
    if (selectedTabIndex == 0) {
      return Mapdata(endPoint: ApiService.endPointUrl);
    } else if (selectedTabIndex == 1) {
      return Mapdata(endPoint: ApiService.teslaUrl);
    } else if (selectedTabIndex == 2) {
      return Mapdata(endPoint: ApiService.businessUrl);
    } else if (selectedTabIndex == 3) {
      return Mapdata(endPoint: ApiService.techUrl);
    } else if (selectedTabIndex == 4) {
      return Mapdata(endPoint: ApiService.wallstreetUrl);
    } else {
      return const CircularProgressIndicator(
        strokeWidth: 3,
      );
    }
  }
}
