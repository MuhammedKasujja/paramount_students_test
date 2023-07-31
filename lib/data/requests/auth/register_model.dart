import 'dart:convert';

String registerModelToJson(RegisterModel? data) => json.encode(data!.toJson());

class RegisterModel {
  RegisterModel({
    this.firstName,
    this.lastName,
    this.otherName,
    this.email,
    this.phone,
    this.password,
  });

  String? firstName;
  String? lastName;
  String? otherName;
  String? email;
  String? phone;
  String? password;

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "other_name": otherName,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
