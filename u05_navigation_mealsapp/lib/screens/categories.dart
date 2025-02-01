import 'package:flutter/material.dart';

import 'package:u05_navigation_mealsapp/data/dummy_data.dart';
import 'package:u05_navigation_mealsapp/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final availableCategory in availableCategories)
            CategoryGridItem(category: availableCategory),
        ],
      ),
    );
  }
}
