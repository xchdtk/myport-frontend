// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myport/models/register.dart';

class RemoteServices {
  static final client = http.Client();

  static Future<CertifiationNumber?> fetchCertificationNumber(value) async {
    final response = await client
        .get(Uri.parse('http://localhost:5000/api/user/phone/$value'));
    if (response.statusCode == 200) {
      final parsedBody = jsonDecode(response.body);
      return CertifiationNumber.fromJson(parsedBody);
    } else {
      return null;
    }
  }
}
