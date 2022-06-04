// ignore_for_file: non_constant_identifier_names, unused_local_variable

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
