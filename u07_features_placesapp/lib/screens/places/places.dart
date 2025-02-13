import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:u07_features_placesapp/themes/main_theme.dart';
import 'package:u07_features_placesapp/widgets/main_bottom_navigation_bar.dart';
import 'package:u07_features_placesapp/widgets/main_drawer.dart';
import 'package:u07_features_placesapp/models/place.dart';
import 'package:u07_features_placesapp/providers/placeProvider.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({
    super.key,
    required this.selectedPageIndex,
    required this.onSelectPage,
  });

  final int selectedPageIndex;
  final void Function(int index) onSelectPage;

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
      return Center(child: Text('Places'));
    }
  }

  void _onAddButton({required BuildContext context, required WidgetRef ref}) {
    /* final newPlace = await Navigator.of(context).push<Place>(
      MaterialPageRoute(
        builder: (ctx) => const NewPlaceScreen(),
      ),
    );

    if (newPlace == null) {
      return;
    }

    ref.read(placesProvider.notifier).addPlace(newPlace); */
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        backgroundColor: kSeedColor,
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedPageIndex: selectedPageIndex,
        onSelectPage: onSelectPage,
        onAddButton: () => _onAddButton(context: context, ref: ref),
      ),
      body: _bodyContent(
        context: context,
        places: places,
      ),
    );
  }
}
