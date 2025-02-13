import 'package:flutter/material.dart';

import 'package:u07_features_placesapp/themes/main_theme.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    required this.selectedPageIndex,
    required this.onSelectPage,
    // required this.onAddButton,
  });

  final int selectedPageIndex;
  final void Function(int index) onSelectPage;
  // final void Function() onAddButton;

  @override
  Widget build(BuildContext context) {
    // const addIconSize = 60.0;

    return Container(
      color: kSeedColor,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: selectedPageIndex,
        onTap: onSelectPage,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(255, 232, 232, 232),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.maps_home_work_sharp),
          ),
/*           BottomNavigationBarItem(
            icon: Container(
              height: addIconSize,
              width: addIconSize,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            label: '',
          ), */
          BottomNavigationBarItem(
            label: 'Other',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
