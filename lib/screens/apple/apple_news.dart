import 'package:flutter/material.dart';
import 'package:news_api_app/constants/spaces.dart';
import 'package:news_api_app/model/news_api_model.dart';
import 'package:news_api_app/screens/apple/widgets/header.dart';
import 'package:news_api_app/services/api_service.dart';
import 'package:news_api_app/services/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Articles>? articles;
  @override
  void initState() {
    getData();

    // TODO: implement initState
    super.initState();
  }

  void getData() async {
    final articles = await NewsProvider.getArticle(ApiService.endPointUrl);
    setState(() {
      this.articles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Apple News',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      body: Column(
        children: [
          const Header(),
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
                                        articles?[index].title ??
                                            'not available',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                          articles?[index].description ??
                                              'not available'),
                                    ))
                          ],
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}
