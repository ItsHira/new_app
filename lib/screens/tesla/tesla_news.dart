import 'package:flutter/material.dart';
import 'package:news_api_app/screens/widgets/data_function.dart';

import '../../constants/spaces.dart';
import '../../services/api_service.dart';

class TeslaNews extends StatefulWidget {
  const TeslaNews({super.key});

  @override
  State<TeslaNews> createState() => _TeslaNewsState();
}

class _TeslaNewsState extends State<TeslaNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tesla',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Spaces.h30,
          Mapdata(endPoint: ApiService.teslaUrl),
        ],
      ),
    );
  }
}
