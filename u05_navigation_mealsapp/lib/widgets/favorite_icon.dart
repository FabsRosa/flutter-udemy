import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:u05_navigation_mealsapp/models/meal.dart';
import 'package:u05_navigation_mealsapp/providers/favorites_provider.dart';

class FavoriteIcon extends ConsumerStatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  ConsumerState<FavoriteIcon> createState() {
    return _FavoriteIconState();
  }
}

class _FavoriteIconState extends ConsumerState<FavoriteIcon> {
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          final wasFavorited = ref
              .read(favoriteMealsProvider.notifier)
              .toggleMealFavoriteStatus(widget.meal);
          if (wasFavorited) {
            _showInfoMessage('Added to favorites!');
          } else {
            _showInfoMessage('Removed from favorites!');
          }
        });
      },
      icon: Icon(
          ref.watch(favoriteMealsProvider.notifier).isMealFavorited(widget.meal)
              ? Icons.star
              : Icons.star_border),
    );
  }
}
