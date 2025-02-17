import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.onPickImage,
    this.hasError = false,
  });

  final bool hasError;
  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _takenImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    } else {}

    setState(() {
      _takenImage = File(pickedImage.path);
    });

    widget.onPickImage(_takenImage!);
  }

  Widget _emptyPictureButton() {
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
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: _takePicture,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.camera,
                  size: 50,
                  color: buttonColor,
                ),
                const SizedBox(height: 8),
                Text(
                  'Take Picture',
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _takenPictureButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      width: double.infinity,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _takenImage!,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonContent =
        _takenImage == null ? _emptyPictureButton() : _takenPictureButton();

    return buttonContent;
  }
}
