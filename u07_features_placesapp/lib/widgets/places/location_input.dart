import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

import 'package:u07_features_placesapp/models/place.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({
    super.key,
    required this.onPickLocation,
    this.hasError = false,
  });

  final void Function(PlaceLocation image) onPickLocation;
  final bool hasError;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;
  final apiKey = 'AIzaSyBIle6TDQROYB3EFh0HNgTLrVbqmpV2N5I';

  Color get buttonColor {
    if (widget.hasError) {
      return Theme.of(context).colorScheme.error;
    } else {
      return Theme.of(context).colorScheme.primary;
    }
  }

  String get locationImage {
    if (_pickedLocation == null ||
        _pickedLocation?.latitude == null ||
        _pickedLocation?.longitude == null) {
      return '';
    }
    final latitude = _pickedLocation!.latitude;
    final longitude = _pickedLocation!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:%7C$latitude,$longitude&key=$apiKey';
  }

  Widget get _locationPreview {
    late Widget containerContent;
    if (_isGettingLocation) {
      // Loading...
      containerContent = const CircularProgressIndicator();
    } else if (_pickedLocation != null) {
      // Map snapshot
      containerContent = FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        image: NetworkImage(locationImage),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    } else {
      // Field empty
      containerContent = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_pin,
            size: 42,
            color: buttonColor,
          ),
          const SizedBox(height: 8),
          Text(
            'No location chosen',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: buttonColor),
          ),
        ],
      );
    }
    return Container(
      alignment: Alignment.center,
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: buttonColor.withValues(alpha: 0.2),
        ),
      ),
      child: containerContent,
    );
  }

  Widget get _currentLocationButton {
    return TextButton.icon(
      icon: Icon(
        Icons.my_location,
        color: buttonColor,
      ),
      label: Text(
        'Get Current Location',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 11.5,
              color: buttonColor,
            ),
      ),
      onPressed: _getCurrentLocation,
    );
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final latitude = locationData.latitude;
    final longitude = locationData.longitude;

    if (latitude == null || longitude == null) {
      return;
    }

    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey');

    final response = await http.get(url);
    final responseData = json.decode(response.body);
    final address = responseData['results'][0]['formatted_address'];

    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: latitude,
        longitude: longitude,
        address: address,
      );
      _isGettingLocation = false;
    });

    widget.onPickLocation(_pickedLocation!);
  }

  Widget get _selectOnMapButton {
    return TextButton.icon(
      icon: Icon(
        Icons.map,
        color: buttonColor,
      ),
      label: Text(
        'Select on Map',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 11.5,
              color: buttonColor,
            ),
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          _locationPreview,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _currentLocationButton,
              _selectOnMapButton,
            ],
          )
        ],
      ),
    );
  }
}
