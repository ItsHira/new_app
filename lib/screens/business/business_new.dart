import 'package:flutter/material.dart';
import 'package:news_api_app/screens/widgets/data_function.dart';

import '../../constants/spaces.dart';
import '../../services/api_service.dart';

class BusinessNews extends StatefulWidget {
  const BusinessNews({super.key});

  @override
  State<BusinessNews> createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
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
          Mapdata(endPoint: ApiService.businessUrl),
        ],
      ),
    );
  }
}
