import 'package:flutter/material.dart';

import 'package:u05_navigation_mealsapp/data/dummy_data.dart';
import 'package:u05_navigation_mealsapp/models/category.dart';
import 'package:u05_navigation_mealsapp/models/meal.dart';
import 'package:u05_navigation_mealsapp/screens/meals.dart';
import 'package:u05_navigation_mealsapp/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  void _selectCategory({
    required BuildContext context,
    required Category category,
  }) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: _selectCategory,
          ),
      ],
    );
  }
}
