import 'package:get/get.dart';

class ContentPageViewController extends GetxController {
  // ignore: non_constant_identifier_names
  RxInt current_page = 0.obs;

  void updatePage(value) {
    current_page(value);
  }
}
