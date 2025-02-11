import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:u06_forms_shoppinglistapp/data/categories.dart';
import 'package:u06_forms_shoppinglistapp/models/grocery.dart';
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
  List<Grocery> _groceries = [];
  late Future<List<Grocery>> _loadedItems;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Future<List<Grocery>> _loadItems() async {
    final url = Uri.https(
        'flutter-u06-forms-default-rtdb.firebaseio.com', 'shopping-list.json');
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch from server. Please try again later.');
      return [];
    } else if (response.body == 'null') {
      // setState(() {
      //   _isLoading = false;
      // });
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<Grocery> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere((categoryItem) =>
              categoryItem.value.title == item.value['category'])
          .value;
      loadedItems.add(Grocery(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }
    return loadedItems;
  }

  void _addItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<Grocery>(
      MaterialPageRoute(
        builder: (ctx) => const NewItemScreen(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceries.add(newItem);
    });
  }

  void _removeItem({
    required Grocery grocery,
    required int groceryIndex, // groceries.indexOf(grocery)
  }) async {
    final url = Uri.https('flutter-u06-forms-default-rtdb.firebaseio.com',
        'shopping-list/${grocery.id}.json');
    setState(() {
      _groceries.remove(grocery);
    });
    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceries.insert(groceryIndex, grocery);
      });
      if (!mounted) {
        return;
      }
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Deletion failed.'),
          content: const Text('Failed to delete item. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget bodyContent;

    if (_error != null) {
      bodyContent = Center(
        child: Text(
          _error!,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: kSeedColor,
              ),
        ),
      );
    } else if (_groceries.isEmpty) {
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
        itemCount: _groceries.length,
        itemBuilder: (ctx, index) => GroceryItem(
          grocery: _groceries[index],
          groceryIndex: index,
          onDeleted: _removeItem,
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
      body: FutureBuilder(
        future: _loadedItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {}
        },
      ),
    );
  }
}
