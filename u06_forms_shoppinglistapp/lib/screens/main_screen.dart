import 'package:flutter/material.dart';

import 'package:u06_forms_shoppinglistapp/screens/groceries/groceries.dart';

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
      activePage = Groceries(
        selectedPageIndex: _selectedPageIndex,
        onSelectPage: _selectPage,
      );
    } else if (_selectedPageIndex == 1) {
      activePage = Groceries(
        selectedPageIndex: _selectedPageIndex,
        onSelectPage: _selectPage,
      );
    }

    return activePage;
  }
}
