import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

abstract class UserProfileController extends GetxController {
  selectFile();
}

class UserProfileControllerImp extends UserProfileController {
  File? file;

  @override
  selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
    }
    update();
  }
}
