import 'package:flutter/material.dart';
import 'package:news_api_app/providers/provider_function.dart';
import 'package:news_api_app/screens/apple/apple_news.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderFuntion(),
        ),
      ],
      child: MaterialApp(
        title: 'News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
