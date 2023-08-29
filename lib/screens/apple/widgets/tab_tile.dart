import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/provider_function.dart';

class TabTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final int index;
  const TabTile(
      {required this.index,
      required this.title,
      this.isSelected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<ProviderFuntion>(context, listen: false);

    return GestureDetector(
      onTap: () {
        app.changeTab(index);
      },
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: isSelected ? Colors.red : Colors.brown),
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.red : Colors.brown,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
