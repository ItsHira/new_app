import 'package:flutter/material.dart';
import 'package:news_api_app/screens/widgets/data_function.dart';

import '../../constants/spaces.dart';
import '../../services/api_service.dart';

class TechNews extends StatefulWidget {
  const TechNews({super.key});

  @override
  State<TechNews> createState() => _TechNewsState();
}

class _TechNewsState extends State<TechNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tech crunch',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Spaces.h30,
          Mapdata(endPoint: ApiService.techUrl),
        ],
      ),
    );
  }
}
