class StudyLangModel {
  final int? id;
  final double amountToPay;
  final String dateOfPayment;
  final String paymentReferId;
  final String paystackSuccessfulReturnResponseValue;

  const StudyLangModel({
    this.id,
    required this.amountToPay,
    required this.dateOfPayment,
    required this.paymentReferId,
    required this.paystackSuccessfulReturnResponseValue,
  });

  Map<String, Object?> toJson() => {
        'id': id,
        'amountToPay': amountToPay,
        'dateOfPayment': dateOfPayment,
        'paymentReferId': paymentReferId,
        'paystackSuccessfulReturnResponseValue':
            paystackSuccessfulReturnResponseValue,
      };

  static StudyLangModel fromJson(Map<String, Object?> json) {
    return StudyLangModel(
      id: json['id'] as int,
      amountToPay: json['amountToPay'] as double,
      dateOfPayment: json['dateOfPayment'] as String,
      paymentReferId: json['paymentReferId'] as String,
      paystackSuccessfulReturnResponseValue:
          json['paystackSuccessfulReturnResponseValue'] as String,
    );
  }
}
