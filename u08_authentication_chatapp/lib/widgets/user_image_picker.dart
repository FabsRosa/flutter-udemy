import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({
    super.key,
    required this.onPickedImage,
  });

  final void Function({required File pickedImage}) onPickedImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    widget.onPickedImage(pickedImage: _pickedImageFile!);
  }

  Widget get _pictureButton {
    return FormField<File>(
      builder: (state) {
        return Column(
          children: [
            if (_pickedImageFile != null)
              _selectedPictureButton
            else
              _emptyPictureButton(
                hasError: state.hasError,
              ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
      validator: (value) {
        if (_pickedImageFile == null) {
          return 'A picture must be selected.';
        } else {
          return null;
        }
      },
    );
  }

  Widget get _selectedPictureButton {
    const containerSize = 160.0;
    return Hero(
      tag: 'main_logo',
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        height: containerSize,
        width: containerSize,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: _pickImage,
          child: ClipOval(
              child: Image.file(
            _pickedImageFile!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )),
        ),
      ),
    );
  }

  Widget _emptyPictureButton({
    bool hasError = false,
  }) {
    const containerSize = 160.0;
    return Hero(
      tag: 'main_logo',
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: hasError
                ? Theme.of(context).colorScheme.error.withValues(alpha: 0.2)
                : Colors.white.withValues(alpha: 0.4),
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        height: containerSize,
        width: containerSize,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: _pickImage,
          child: Icon(
            Icons.person,
            size: 60,
            color:
                hasError ? Theme.of(context).colorScheme.error : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget get _addImageButton {
    return TextButton.icon(
      onPressed: _pickImage,
      icon: Icon(
        Icons.camera,
        color: Colors.white,
      ),
      label: const Text(
        'Add Image',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _pictureButton,
        _addImageButton,
      ],
    );
  }
}
