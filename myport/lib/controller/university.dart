// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:myport/models/register.dart';
import 'package:myport/services/remote_services.dart';

class UniversityController extends GetxController {
  RxBool isLoading = true.obs;
  List<University> university_list = [];
  RxList search_university_list = [].obs;
  List<dynamic> major_list = [];
  RxList search_major_list = [].obs;

  void fetchUniversityInformation() async {
    isLoading(true);
    try {
      final universit_list = await RemoteServices.fetchUniversity();
      university_list = universit_list;
    } finally {
      isLoading(false);
    }
    isLoading(false);

    update();
  }

  void updateSerchUniversity(value) {
    if (value == "") {
      search_university_list([]);
    } else {
      final university = university_list
          .where((item) => item.university_name.contains(value))
          .toList();
      search_university_list(university);
    }
  }

  void setMajor(value) {
    major_list = value;
    update();
  }

  void updateSearchMajor(value) {
    if (value == "") {
      search_major_list([]);
    } else {
      final major = major_list.where((item) => item.contains(value)).toList();
      search_major_list(major);
    }
  }
}
