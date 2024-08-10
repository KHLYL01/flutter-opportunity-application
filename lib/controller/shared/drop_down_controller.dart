import 'package:get/get.dart';

class DropDownController extends GetxController {
  RxList<String> list = <String>[].obs;
  RxString currentSelected = ''.obs;

  DropDownController(List<String> list, String currentSelected) {
    this.list(list);
    this.currentSelected(currentSelected);
  }

  onChange(String value) {
    currentSelected(value);
  }
}
