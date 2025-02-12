import 'package:flutter/material.dart';

import 'package:u07_features_placesapp/screens/places/places.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    late Widget activePage;

    if (_selectedPageIndex == 0) {
      activePage = PlacesScreen(
        selectedPageIndex: _selectedPageIndex,
        onSelectPage: _selectPage,
      );
    } else if (_selectedPageIndex == 1) {
      activePage = PlacesScreen(
        selectedPageIndex: _selectedPageIndex,
        onSelectPage: _selectPage,
      );
    }

    return activePage;
  }
}
