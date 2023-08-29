import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/provider_function.dart';

class CardData extends StatefulWidget {
  const CardData({super.key});

  @override
  State<CardData> createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  @override
  Widget build(BuildContext context) {
    final newsArticle = Provider.of<ProviderFuntion>(context, listen: true);

    return Expanded(
        child: Card(
      color: Colors.blue.shade100,
      child: newsArticle.cardDataProvider(newsArticle.selectedTabIndex),
    ));
  }
}
