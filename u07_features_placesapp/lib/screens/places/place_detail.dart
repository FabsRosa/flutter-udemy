import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:u07_features_placesapp/models/place.dart';
import 'package:u07_features_placesapp/screens/places/map.dart';
import 'package:u07_features_placesapp/themes/main_theme.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    super.key,
    required this.place,
  });

  final Place place;

  String get locationImage {
    final apiKey = 'AIzaSyBIle6TDQROYB3EFh0HNgTLrVbqmpV2N5I';
    final latitude = place.location.latitude;
    final longitude = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:%7C$latitude,$longitude&key=$apiKey';
  }

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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MapScreen(
                          location: place.location,
                          isSelecting: false,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: MemoryImage(kTransparentImage),
                    foregroundImage: NetworkImage(locationImage),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 42),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black54],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
