import 'package:flutter/material.dart';

import 'package:u07_features_placesapp/models/place.dart';
import 'package:u07_features_placesapp/widgets/places/place_item.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
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
}
