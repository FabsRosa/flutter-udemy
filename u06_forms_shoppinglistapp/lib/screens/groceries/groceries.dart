import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:u06_forms_shoppinglistapp/providers/groceries_provider.dart';
import 'package:u06_forms_shoppinglistapp/screens/groceries/new_item.dart';
import 'package:u06_forms_shoppinglistapp/theme/app_theme.dart';
import 'package:u06_forms_shoppinglistapp/widgets/groceries/grocery_item.dart';
import 'package:u06_forms_shoppinglistapp/widgets/main_screen/main_bottom_navigation_bar.dart';
import 'package:u06_forms_shoppinglistapp/widgets/main_screen/main_drawer.dart';

class Groceries extends ConsumerWidget {
  const Groceries({
    super.key,
    required this.selectedPageIndex,
    required this.onSelectPage,
  });

  final int selectedPageIndex;
  final void Function(int index) onSelectPage;

  void _addItem(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItemScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceries = ref.watch(groceriesProvider);
    return Scaffold(
      appBar: AppTheme.gradientAppBar(
        title: Text('Groceries'),
        actions: [
          IconButton(
            onPressed: () {
              _addItem(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedPageIndex: selectedPageIndex,
        onSelectPage: onSelectPage,
      ),
      body: ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (ctx, index) => GroceryItem(grocery: groceries[index]),
      ),
    );
  }
}
