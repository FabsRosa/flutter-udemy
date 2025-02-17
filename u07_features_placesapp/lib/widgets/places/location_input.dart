import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({
    super.key,
    this.hasError = false,
  });

  final bool hasError;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  Location? _pickedLocation;
  var _isGettingLocation = false;

  Widget _locationPreview({required Color buttonColor}) {
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
      child: Text(
        'No location chosen',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: buttonColor,
            ),
      ),
    );
  }

  Widget _currentLocationIcon({required Color buttonColor}) {}

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

    setState(() {
      _isGettingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = widget.hasError
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.primary;

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          _locationPreview(buttonColor: buttonColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
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
              ),
              TextButton.icon(
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
