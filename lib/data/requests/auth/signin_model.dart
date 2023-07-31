import 'dart:convert';

String signInModelToJson(SignInModel? data) => json.encode(data!.toJson());

class SignInModel {
  SignInModel({
    this.email,
    required this.password,
    this.phone,
  });

  String? email;
  String password;
  String? phone;

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "phone": phone,
      };
}
