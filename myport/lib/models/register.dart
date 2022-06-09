// ignore_for_file: non_constant_identifier_names

class CertifiationNumber {
  final int number;

  CertifiationNumber({required this.number});

  factory CertifiationNumber.fromJson(Map<String, dynamic> json) {
    return CertifiationNumber(number: json['number']);
  }
}

class University {
  final String university_name;
  final List<dynamic> major_name;

  University({required this.university_name, required this.major_name});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
        university_name: json['university_name'],
        major_name: json['major_name']);
  }
}
