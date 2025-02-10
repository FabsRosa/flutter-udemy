import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:u06_forms_shoppinglistapp/data/categories.dart';
import 'package:u06_forms_shoppinglistapp/models/category.dart';

import 'package:u06_forms_shoppinglistapp/models/grocery.dart';
import 'package:u06_forms_shoppinglistapp/providers/groceries_provider.dart';
import 'package:u06_forms_shoppinglistapp/theme/app_theme.dart';
import 'package:u06_forms_shoppinglistapp/screens/groceries/new_item.dart';
import 'package:u06_forms_shoppinglistapp/widgets/groceries/grocery_item.dart';
import 'package:u06_forms_shoppinglistapp/widgets/main_screen/main_bottom_navigation_bar.dart';
import 'package:u06_forms_shoppinglistapp/widgets/main_screen/main_drawer.dart';

class GroceriesScreen extends StatefulWidget {
  GroceriesScreen({
    super.key,
    required this.selectedPageIndex,
    required this.onSelectPage,
  });

  final int selectedPageIndex;
  final void Function(int index) onSelectPage;

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  List<Grocery> groceries = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-u06-forms-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);
    final Map<String, Map<String, dynamic>> listData = json.decode(response.body);
    final List<Grocery> _loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries;
      _loadedItems.add(Grocery(id: item.key, name: item.value['name'], quantity: item.value['quantity'], category: Category(title: title, color: color)))
    }
  }

  void _addItem(BuildContext context) async {
    await Navigator.of(context).push<Grocery>(
      MaterialPageRoute(
        builder: (ctx) => const NewItemScreen(),
      ),
    );

    _loadItems();
    // ref.read(groceriesProvider.notifier).addGrocery(newItem);
  }

  @override
  Widget build(BuildContext context) {
    late Widget bodyContent;

    if (groceries.isEmpty) {
      bodyContent = Center(
        child: Text(
          'Try adding some groceries.',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: kSeedColor,
              ),
        ),
      );
    } else {
      bodyContent = ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (ctx, index) => GroceryItem(
          grocery: groceries[index],
          groceryIndex: index,
        ),
      );
    }

    return Scaffold(
      appBar: AppTheme.gradientAppBar(
        title: Text('GroceriesScreen'),
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
        selectedPageIndex: widget.selectedPageIndex,
        onSelectPage: widget.onSelectPage,
      ),
      body: bodyContent,
    );
  }
}
