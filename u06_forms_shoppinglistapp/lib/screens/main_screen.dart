import 'package:flutter/material.dart';
import 'package:u06_forms_shoppinglistapp/screens/groceries.dart';
import 'package:u06_forms_shoppinglistapp/theme/app_theme.dart';
import 'package:u06_forms_shoppinglistapp/widgets/main_drawer.dart';

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
    late String activePageTitle;
    late Widget activePage;

    if (_selectedPageIndex == 0) {
      activePageTitle = 'Groceries';
      activePage = Groceries();
    }

    return Scaffold(
      appBar: AppTheme.gradientAppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: kGradientColor,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}
