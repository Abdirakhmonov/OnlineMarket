
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _popUpMenuVal = 'Sort by';
  int _tappedIndex = -1;

  void _handleTap(int index) {
    _tappedIndex = index;
    setState(() {});
  }

  List<String> texts = [
    'apple',
    'fwgapple',
    'appgwrgle',
    'applegwr',
    'applewg',
    'applgrwe',
  ];

  void _sortTexts(String criterion) {
    if (criterion == 'A-Z') {
      texts.sort((a, b) => a.compareTo(b));
    } else if (criterion == 'Z-A') {
      texts.sort((a, b) => b.compareTo(a));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
