import 'package:flutter/material.dart';
import 'package:news_api_app/constants/spaces.dart';
import 'package:news_api_app/screens/apple/widgets/header.dart';
import 'package:news_api_app/screens/widgets/data_function.dart';
import 'package:news_api_app/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Apple News',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const Header(),
          Spaces.h30,
          Mapdata(endPoint: ApiService.endPointUrl),
        ],
      ),
    );
  }
}
