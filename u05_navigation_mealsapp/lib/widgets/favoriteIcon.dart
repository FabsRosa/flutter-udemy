import 'package:flutter/material.dart';
import 'package:u05_navigation_mealsapp/models/meal.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  State<FavoriteIcon> createState() {
    return _FavoriteIconState();
  }
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.onToggleFavorite(widget.meal);
        });
      },
      icon: Icon(
          widget.isMealFavorited(widget.meal) ? Icons.star : Icons.star_border),
    );
  }
}
