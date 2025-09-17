import 'dart:developer';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class PickImageServices {
  // image picker constructer
  final ImagePicker picker = ImagePicker();

  Future<Uint8List?> pickFromGallery() async {
    try {
      // Pick image from gallery
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // Convert to binary (Uint8List)
        final Uint8List bytes = await image.readAsBytes();
        log(bytes.toString());
        return bytes;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
