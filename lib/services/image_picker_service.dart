import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> getProfileImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
