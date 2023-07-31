import 'package:equatable/equatable.dart';

import 'userdata.dart';

class SigninResponse extends Equatable {
  final String? message;
  final Userdata? userdata;

  const SigninResponse({this.message, this.userdata});

  factory SigninResponse.fromSigninResponse(Map<String, dynamic> json) {
    return SigninResponse(
      message: json['message'] as String?,
      userdata: json['userdata'] == null
          ? null
          : Userdata.fromSigninResponse(
              json['userdata'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toSigninResponse() => {
        'message': message,
        'userdata': userdata?.toSigninResponse(),
      };

  SigninResponse copyWith({
    String? message,
    Userdata? userdata,
  }) {
    return SigninResponse(
      message: message ?? this.message,
      userdata: userdata ?? this.userdata,
    );
  }

  @override
  List<Object?> get props => [message, userdata];
}
