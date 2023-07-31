import 'package:equatable/equatable.dart';

class Userdata extends Equatable {
  final int? id;
  final int? otp;
  final int? uniqueId;
  final String? fullName;

  const Userdata({this.id, this.otp, this.uniqueId, this.fullName});

  factory Userdata.fromSigninResponse(Map<String, dynamic> json) => Userdata(
        id: json['id'] as int?,
        otp: json['otp'] as int?,
        uniqueId: json['unique_id'] as int?,
        fullName: json['full_name'] as String?,
      );

  Map<String, dynamic> toSigninResponse() => {
        'id': id,
        'otp': otp,
        'unique_id': uniqueId,
        'full_name': fullName,
      };

  Userdata copyWith({
    int? id,
    int? otp,
    int? uniqueId,
    String? fullName,
  }) {
    return Userdata(
      id: id ?? this.id,
      otp: otp ?? this.otp,
      uniqueId: uniqueId ?? this.uniqueId,
      fullName: fullName ?? this.fullName,
    );
  }

  @override
  List<Object?> get props => [id, otp, uniqueId, fullName];
}
