// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

Future<Uint8List?> pickImageFromGallery(ImageSource source) async {
  final ImagePicker _imagePicker =
      ImagePicker(); //ImagePicker has two methods getImage(get image from camera or gallery), pickImage (allows pick image from gallery)
  XFile? _file = await _imagePicker.pickImage(
      source: source); //class in photo manager of dart contains file details
  if (_file != null) {
    return await _file.readAsBytes();
  } else {
    print("No image selected");
    return null;
  }
}

Future<Uint8List?> pickImageFromCamera() async {
  final ImagePicker _imagePicker =
      ImagePicker(); //ImagePicker has two methods getImage(get image from camera or gallery), pickImage (allows pick image from gallery)
  XFile? _file = await _imagePicker.pickImage(
      source: ImageSource
          .camera); //class in photo manager of dart contains file details
  if (_file != null) {
    return await _file.readAsBytes();
  } else {
    print("No image selected");
    return null;
  }
}

// Method to get the user's current location
Future<Position> getUserLocation() async {
  LocationPermission permission;
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are denied');
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return position;
}
