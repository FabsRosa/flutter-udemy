import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:u07_features_placesapp/models/place.dart';
import 'package:u07_features_placesapp/providers/placeProvider.dart';

class PlaceItem extends ConsumerWidget {
  const PlaceItem({
    super.key,
    required this.place,
    required this.index,
  });

  final Place place;
  final int index;

  _onDeleteItem({required Place place, required WidgetRef ref}) {
    ref.read(placesProvider.notifier).removePlace(place);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(place.id),
      background: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
        _onDeleteItem(
          place: place,
          ref: ref,
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.title,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
