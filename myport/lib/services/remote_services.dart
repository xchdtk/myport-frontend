// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myport/models/register.dart';

class RemoteServices {
  static final client = http.Client();

  static Future<CertifiationNumber?> fetchCertificationNumber(value) async {
    final response = await client
        .get(Uri.parse('http://localhost:5000/api/user/phone/$value'));
    if (response.statusCode == 200) {
      final parsed_body = jsonDecode(response.body);
      return CertifiationNumber.fromJson(parsed_body);
    } else {
      return null;
    }
  }

  static Future<List<University>> fetchUniversity() async {
    final response = await client
        .get(Uri.parse('http://localhost:5000/api/user/university'));
    if (response.statusCode == 200) {
      final parsed_body = jsonDecode(response.body);
      final university_list = parsed_body['university']
          .map<University>((item) => University.fromJson(item))
          .toList();
      return university_list;
    }
    return [];
  }
}
