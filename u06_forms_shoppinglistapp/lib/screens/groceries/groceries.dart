import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u06_forms_shoppinglistapp/models/grocery.dart';

import 'package:u06_forms_shoppinglistapp/providers/groceries_provider.dart';
import 'package:u06_forms_shoppinglistapp/theme/app_theme.dart';
import 'package:u06_forms_shoppinglistapp/screens/groceries/new_item.dart';
import 'package:u06_forms_shoppinglistapp/widgets/groceries/grocery_item.dart';
import 'package:u06_forms_shoppinglistapp/widgets/main_screen/main_bottom_navigation_bar.dart';
import 'package:u06_forms_shoppinglistapp/widgets/main_screen/main_drawer.dart';

class GroceriesScreen extends ConsumerWidget {
  const GroceriesScreen({
    super.key,
    required this.selectedPageIndex,
    required this.onSelectPage,
  });

  final int selectedPageIndex;
  final void Function(int index) onSelectPage;

  void _addItem(BuildContext context, WidgetRef ref) async {
    final newItem = await Navigator.of(context).push<Grocery>(
      MaterialPageRoute(
        builder: (ctx) => const NewItemScreen(),
      ),
    );

    if (newItem == null) {
      return;
    }

    ref.read(groceriesProvider.notifier).addGrocery(newItem);
  }

  Widget _bodyItem({
    required List<Grocery> groceries,
    required BuildContext context,
  }) {
    if (groceries.isEmpty) {
      return Center(
        child: Text(
          'Try adding some groceries.',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: kSeedColor,
              ),
        ),
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 11),
          Expanded(
            child: ListView.builder(
              itemCount: groceries.length,
              itemBuilder: (ctx, index) =>
                  GroceryItem(grocery: groceries[index]),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceries = ref.watch(groceriesProvider);
    return Scaffold(
      appBar: AppTheme.gradientAppBar(
        title: Text('GroceriesScreen'),
        actions: [
          IconButton(
            onPressed: () {
              _addItem(context, ref);
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
      body: _bodyItem(
        groceries: groceries,
        context: context,
      ),
    );
  }
}
