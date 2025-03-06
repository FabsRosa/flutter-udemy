import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:u08_authentication_chatapp/themes/main_theme.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({
    super.key,
  });

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      // imageQuality: 50,
      // maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });
  }

  Widget get _emptyPictureButton {
    const containerSize = 150.0;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kSeedColorBrighter.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      height: containerSize,
      width: containerSize,
      alignment: Alignment.center,
      child: _pickedImageFile != null
          ? Image.file(_pickedImageFile!)
          : TextButton(
              onPressed: _pickImage,
              child: Icon(
                Icons.person,
                size: 60,
                color: kSeedColorBrighter,
              ),
            ),
    );
  }

  Widget get _addImageButton {
    return TextButton.icon(
      onPressed: _pickImage,
      icon: Icon(
        Icons.camera,
        color: kSeedColorBrighter,
      ),
      label: const Text(
        'Add Image',
        style: TextStyle(
          color: kSeedColorBrighter,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _emptyPictureButton,
        // _addImageButton,
      ],
    );
  }
}
