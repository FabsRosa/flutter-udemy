import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u05_navigation_mealsapp/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
