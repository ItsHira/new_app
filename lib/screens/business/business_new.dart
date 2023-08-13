import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/spaces.dart';
import '../../model/news_api_model.dart';
import '../../services/api_service.dart';
import '../../services/provider.dart';

class BusinessNews extends StatefulWidget {
  const BusinessNews({super.key});

  @override
  State<BusinessNews> createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  List<Articles>? articles;
  @override
  void initState() {
    getData();

    super.initState();
  }

  void getData() async {
    final articles = await NewsProvider.getArticle(ApiService.businessUrl);
    setState(
      () {
        this.articles = articles;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Business',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Spaces.h30,
          Expanded(
            child: Card(
              child: articles == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            articles!.length,
                            (index) => ListTile(
                              leading: CachedNetworkImage(
                                imageUrl: articles?[index].urlToImage ??
                                    'not available',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              title: Text(
                                articles?[index].title ?? 'not available',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(articles?[index].description ??
                                  'not available'),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
