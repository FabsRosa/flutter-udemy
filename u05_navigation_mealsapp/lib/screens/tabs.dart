import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:u05_navigation_mealsapp/models/meal.dart';
import 'package:u05_navigation_mealsapp/screens/categories.dart';
import 'package:u05_navigation_mealsapp/screens/filters.dart';
import 'package:u05_navigation_mealsapp/screens/meals.dart';
import 'package:u05_navigation_mealsapp/widgets/main_drawer.dart';
import 'package:u05_navigation_mealsapp/providers/meals_provider.dart';
import 'package:u05_navigation_mealsapp/providers/favorites_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: true,
  Filter.vegetarian: false,
  Filter.vegan: true,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreensState();
  }
}

class _TabsScreensState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    var activePageTitle = 'Categories';
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );

    if (_selectedPageIndex == 1) {
      final favoriteMeal = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeal,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _selectPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_dining),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
