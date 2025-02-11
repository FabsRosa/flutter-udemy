import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u06_forms_shoppinglistapp/models/grocery.dart';

class GroceryItem extends ConsumerWidget {
  const GroceryItem({
    super.key,
    required this.grocery,
    required this.groceryIndex,
    required this.onDeleted,
  });

  final Grocery grocery;
  final int groceryIndex;
  final void Function({
    required Grocery grocery,
    required int groceryIndex,
  }) onDeleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const paddingSize = 24.0;
    return Dismissible(
      key: ValueKey(grocery.id),
      background: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: paddingSize),
        child: Row(
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            const Spacer(),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        onDeleted(
          grocery: grocery,
          groceryIndex: groceryIndex,
        );
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          paddingSize,
          groceryIndex == 0 ? paddingSize : paddingSize / 2,
          paddingSize,
          paddingSize / 2,
        ),
        child: Row(
          key: ValueKey(grocery.id),
          children: [
            Container(
              width: paddingSize,
              height: paddingSize,
              color: grocery.category.color,
            ),
            const SizedBox(width: paddingSize),
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
      ),
    );
  }
}
