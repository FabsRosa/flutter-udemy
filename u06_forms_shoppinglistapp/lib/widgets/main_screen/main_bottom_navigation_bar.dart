import 'package:flutter/material.dart';

import 'package:u06_forms_shoppinglistapp/theme/app_theme.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    required this.selectedPageIndex,
    required this.onSelectPage,
  });

  final int selectedPageIndex;
  final void Function(int index) onSelectPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: kGradientColor,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: selectedPageIndex,
        onTap: onSelectPage,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(255, 232, 232, 232),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Other',
          ),
        ],
      ),
    );
  }
}
