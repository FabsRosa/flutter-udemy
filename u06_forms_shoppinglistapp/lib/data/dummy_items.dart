import 'package:u06_forms_shoppinglistapp/models/category.dart';
import 'package:u06_forms_shoppinglistapp/models/grocery.dart';
import 'package:u06_forms_shoppinglistapp/data/categories.dart';

final groceryItems = [
  Grocery(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categories[Categories.dairy]!,
  ),
  Grocery(
    id: 'b',
    name: 'Bananas',
    quantity: 5,
    category: categories[Categories.fruit]!,
  ),
  Grocery(
    id: 'c',
    name: 'Beef Steak',
    quantity: 1,
    category: categories[Categories.meat]!,
  ),
];
