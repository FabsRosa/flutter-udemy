import 'package:flutter/material.dart';
import 'package:u06_forms_shoppinglistapp/models/grocery.dart';

class GroceryItem extends StatelessWidget {
  const GroceryItem({
    super.key,
    required this.grocery,
  });

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    final paddingSize = 22.0;
    return Padding(
      padding: EdgeInsets.fromLTRB(paddingSize, paddingSize, paddingSize, 0),
      child: Row(
        key: ValueKey(grocery.id),
        children: [
          Container(
            width: paddingSize,
            height: paddingSize,
            color: grocery.category.color,
          ),
          SizedBox(width: paddingSize),
          Text(
            grocery.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Text(
            grocery.quantity.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
