import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u05_navigation_mealsapp/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final isMealFavorite = state.contains(meal);

    if (isMealFavorite) {
      state = state.where((stateMeal) => stateMeal.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }

  bool isMealFavorited(Meal meal) {
    return state.contains(meal);
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
