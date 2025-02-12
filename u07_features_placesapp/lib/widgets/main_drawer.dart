import 'package:flutter/material.dart';

import 'package:u07_features_placesapp/themes/main_theme.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: kGradientColor,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: Row(),
          ),
        ],
      ),
    );
  }
}
