import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:u07_features_placesapp/screens/places/new_place.dart';

import 'package:u07_features_placesapp/themes/main_theme.dart';
import 'package:u07_features_placesapp/models/place.dart';
import 'package:u07_features_placesapp/providers/placeProvider.dart';
import 'package:u07_features_placesapp/widgets/places/placeItem.dart';
// import 'package:u07_features_placesapp/widgets/main_bottom_navigation_bar.dart';
// import 'package:u07_features_placesapp/widgets/main_drawer.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({
    super.key,
    // required this.selectedPageIndex,
    // required this.onSelectPage,
  });

  // final int selectedPageIndex;
  // final void Function(int index) onSelectPage;

  Widget _bodyContent({
    required BuildContext context,
    required List<Place> places,
  }) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'Try adding a place.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => PlaceItem(
          key: ValueKey(places[index].id),
          place: places[index],
          index: index,
        ),
      );
    }
  }

  void _onAddButton({required BuildContext context}) {
    Navigator.of(context).push<Place>(
      MaterialPageRoute(
        builder: (ctx) => const NewPlaceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        backgroundColor: kSeedColor,
        actions: [
          IconButton(
            onPressed: () {
              _onAddButton(
                context: context,
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      /* drawer: MainDrawer(),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedPageIndex: selectedPageIndex,
        onSelectPage: onSelectPage,
        // onAddButton: () => _onAddButton(context: context),
      ), */
      body: _bodyContent(
        context: context,
        places: places,
      ),
    );
  }
}
