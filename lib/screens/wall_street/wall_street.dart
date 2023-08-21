import 'package:flutter/material.dart';
import 'package:news_api_app/screens/widgets/data_function.dart';

import '../../constants/spaces.dart';
import '../../services/api_service.dart';

class WallNews extends StatefulWidget {
  const WallNews({super.key});

  @override
  State<WallNews> createState() => _WallNewsState();
}

class _WallNewsState extends State<WallNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Wall Street',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [Spaces.h30, Mapdata(endPoint: ApiService.wallstreetUrl),],
      ),
    );
  }
}
