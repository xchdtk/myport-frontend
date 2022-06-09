// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';
import 'package:myport/services/remote_services.dart';

import '../models/register.dart';

class RegisterInformationNameController extends GetxController {
  late String name;
  late RxBool is_button_disabled;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    name = '';
    is_button_disabled = false.obs;
  }

  void updateName(value) {
    name = value;
  }

  void updateStateButton(value) {
    is_button_disabled(value);
  }
}

class RegisterInformationPhoneController extends GetxController {
  late RxBool checked_number;
  late RxBool checked_click_button;
  late RxString phone_number;
  late RxBool is_button_disabled;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checked_number = false.obs;
    checked_click_button = false.obs;
    phone_number = ''.obs;
    is_button_disabled = false.obs;
  }

  void updateCheckedNumber(value) {
    checked_number(value);
  }

  void updateCheckedClickButton(value) {
    checked_click_button(value);
  }

  void updatePhoneNumber(value) {
    phone_number(value);
  }

  void updateStateButton(value) {
    is_button_disabled(value);
  }
}

class RegisterCertificationNumberController extends GetxController {
  RxBool isLoading = true.obs;
  final certification_number = CertifiationNumber(number: 0).obs;

  Future<void> fetchCertificationNumber(value) async {
    isLoading(true);
    try {
      final certifiation_number =
          await RemoteServices.fetchCertificationNumber(value);
      if (certifiation_number != null) {
        certification_number(certifiation_number);
      }
    } finally {
      isLoading(false);
    }
    isLoading(false);
  }
}

class RegisterInformationDateOfBirthController extends GetxController {
  late RxBool checked_date_of_birth;
  late RxString date_of_birth;
  late RxString gender_number;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checked_date_of_birth = false.obs;
    date_of_birth = ''.obs;
    gender_number = ''.obs;
  }

  void updateCheckedDateOfBirth(value) {
    checked_date_of_birth(value);
  }

  void updateDateOfBirth(value) {
    date_of_birth(value);
  }

  void updateGenderNumber(value) {
    gender_number(value);
  }
}

class RegisterInformationProfileImageController extends GetxController {
  XFile? image;

  Future updateProfileFromGallery() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }
}

class RegisterInformationUniversityController extends GetxController {
  late University university;
  late RxBool isSelect;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isSelect = false.obs;
  }

  void selectUniversity(value) {
    university = value;
  }

  void changeIsSelect(value) {
    isSelect(value);
  }
}

class RegisterInformationMajorController extends GetxController {
  final FocusNode focusNode = FocusNode();
  RxBool isFocus = false.obs;
  late String major;
  late RxBool isSelect;

  @override
  void onInit() {
    // TODO: implement onInit
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isFocus(true);
      }
    });
    super.onInit();
    isSelect = false.obs;
  }

  void selectMajor(value) {
    major = value;
  }

  void changeIsSelect(value) {
    isSelect(value);
  }
}

class ReigsterInformationGradeController extends GetxController {
  final FocusNode focusNode = FocusNode();
  RxBool isFocus = false.obs;
  late String grade;
  late RxBool isSelect;

  @override
  void onInit() {
    // TODO: implement onInit
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isFocus(true);
      }
    });
    super.onInit();
    isSelect = false.obs;
  }
}
