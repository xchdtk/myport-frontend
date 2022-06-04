class CertifiationNumber {
  final int number;

  CertifiationNumber({required this.number});

  factory CertifiationNumber.fromJson(Map<String, dynamic> json) {
    return CertifiationNumber(number: json['number']);
  }
}
