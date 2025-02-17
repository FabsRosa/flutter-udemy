import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:u07_features_placesapp/models/place.dart';
import 'package:u07_features_placesapp/providers/places_provider.dart';
import 'package:u07_features_placesapp/screens/places/place_detail.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        // Or use Card + InkWell
        child: ListTile(
          leading: CircleAvatar(
            radius: 26,
            foregroundImage: FileImage(place.image),
          ),
          title: Text(
            place.title,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PlaceDetailScreen(place: place),
              ),
            );
          },
        ),
      ),
    );
  }
}
