import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u06_forms_shoppinglistapp/models/grocery.dart';
import 'package:u06_forms_shoppinglistapp/providers/groceries_provider.dart';

class GroceryItem extends ConsumerWidget {
  const GroceryItem({
    super.key,
    required this.grocery,
  });

  final Grocery grocery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paddingSize = 22.0;
    return Dismissible(
      key: ValueKey(grocery.id),
      background: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: paddingSize),
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
        ref.read(groceriesProvider.notifier).removeGrocery(grocery);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            paddingSize, paddingSize / 2, paddingSize, paddingSize / 2),
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
      ),
    );
  }
}
