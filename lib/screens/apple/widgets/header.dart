import 'package:flutter/material.dart';
import 'package:news_api_app/constants/spaces.dart';
import 'package:news_api_app/screens/apple/apple_news.dart';
import 'package:news_api_app/screens/apple/widgets/container.dart';
import 'package:news_api_app/screens/business/business_new.dart';
import 'package:news_api_app/screens/tech_crunch/tech_crunch_new.dart';
import 'package:news_api_app/screens/tesla/tesla_news.dart';
import 'package:news_api_app/screens/wall_street/wall_street.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Spaces.w15,
          ContainerWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            color: Colors.brown,
            child: const Text(
              'Apple',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.brown,
                fontSize: 15,
              ),
            ),
          ),
          Spaces.w15,
          ContainerWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TeslaNews(),
                ),
              );
            },
            color: Colors.yellow,
            child: const Text(
              'Tesla',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontSize: 15,
              ),
            ),
          ),
          Spaces.w15,
          ContainerWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BusinessNews(),
                ),
              );
            },
            color: Colors.blue,
            child: const Text(
              'Business',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
          ),
          Spaces.w15,
          ContainerWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TechNews(),
                ),
              );
            },
            color: Colors.black,
            child: const Text(
              'Tech Crunch',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
          Spaces.w15,
          ContainerWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WallNews(),
                ),
              );
            },
            color: Colors.red,
            child: const Text(
              'Wall Street',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
