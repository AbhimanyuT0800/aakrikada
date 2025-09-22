import 'dart:developer';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class PickImageServices {
  // image picker constructor
  final ImagePicker picker = ImagePicker();

  Future<Uint8List?> pickFromGallery() async {
    try {
      // Pick image from gallery
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // Convert to binary (Uint8List)
        final Uint8List bytes = await image.readAsBytes();
        log("Gallery image picked: ${bytes.length} bytes");
        return bytes;
      }
    } catch (e) {
      log("Error picking from gallery: $e");
    }
    return null;
  }

  Future<Uint8List?> pickFromCamera() async {
    try {
      // Capture image from camera
      final XFile? image = await picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        // Convert to binary (Uint8List)
        final Uint8List bytes = await image.readAsBytes();
        log("Camera image picked: ${bytes.length} bytes");
        return bytes;
      }
    } catch (e) {
      log("Error picking from camera: $e");
    }
    return null;
  }
}
