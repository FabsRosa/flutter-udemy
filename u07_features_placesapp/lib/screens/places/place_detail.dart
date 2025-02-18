import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:u07_features_placesapp/models/place.dart';
import 'package:u07_features_placesapp/themes/main_theme.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        backgroundColor: kSeedColor,
      ),
      body: Stack(
        children: [
          Hero(
            tag: place.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: FileImage(place.image),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
