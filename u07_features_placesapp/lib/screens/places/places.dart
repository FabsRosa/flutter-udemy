import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:u07_features_placesapp/themes/main_theme.dart';
import 'package:u07_features_placesapp/providers/places_provider.dart';
import 'package:u07_features_placesapp/screens/places/new_place.dart';
import 'package:u07_features_placesapp/widgets/places/places_list.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({
    super.key,
  });

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(placesProvider.notifier).loadPlaces();
  }

  void _onAddButton({required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewPlaceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: _placesFuture,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : PlacesList(
                    places: places,
                  ),
      ),
    );
  }
}
