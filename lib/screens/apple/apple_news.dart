import 'package:flutter/material.dart';
import 'package:news_api_app/constants/spaces.dart';
import 'package:news_api_app/screens/apple/widgets/Tab_tile.dart';
import 'package:news_api_app/screens/apple/widgets/card_data.dart';

import '../../providers/provider_function.dart';
part 'static/header_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonState = ProviderFuntion.s(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Daily News',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ..._Data.tabs.map((e) => TabTile(
                          title: e,
                          isSelected: _Data.tabs.indexOf(e) ==
                              buttonState.selectedTabIndex,
                          index: _Data.tabs.indexOf(e),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Spaces.h30,
          const CardData()
        ],
      ),
    );
  }
}
