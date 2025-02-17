import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final buttonColor = widget.hasError
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: buttonColor.withValues(alpha: 0.2),
        ),
      ),
      // height: 250,
      // width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                icon: Icon(Icons.my_location),
                label: const Text('Get Current Location'),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: Icon(Icons.map),
                label: const Text('Select on Map'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
