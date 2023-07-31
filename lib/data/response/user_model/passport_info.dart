class PassportInfo {
  final String number;
  final String countryId;
  final String issueDate;
  final String expiryDate;

  PassportInfo({
    required this.number,
    required this.countryId,
    required this.issueDate,
    required this.expiryDate,
  });

  factory PassportInfo.fromMap(Map<String, dynamic> data) => PassportInfo(
        number: data['passport_id'] as String,
        issueDate: data['issue_date'] as String,
        expiryDate: data['expiry_date'] as String,
        countryId: data['country_local_id'] as String,
      );

  Map<String, dynamic> toMap() => {
        'passport_id': number,
        'issue_date': issueDate,
        'expiry_date': expiryDate,
        'country_local_id': countryId,
      };
}
