import 'package:flutter/material.dart';
import 'package:u07_features_placesapp/models/place.dart';
import 'package:u07_features_placesapp/themes/main_theme.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 0,
      longitude: 0,
      address: '',
    ),
  });

  final PlaceLocation location;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: kSeedColor,
      ),
      body: Center(
        child: Text('Map Screen Content'),
      ),
    );
  }
}
