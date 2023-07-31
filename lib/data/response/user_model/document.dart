import 'dart:convert';

import 'package:equatable/equatable.dart';

class Document extends Equatable {
  final String? highschoolMarksheet;
  final String? highschoolCertificate;
  final String? formalPhoto;
  final String? localIdCard;
  final String? passportFront;

  const Document({
    this.highschoolMarksheet,
    this.highschoolCertificate,
    this.formalPhoto,
    this.localIdCard,
    this.passportFront,
  });

  factory Document.fromMap(Map<String, dynamic> data) => Document(
        highschoolMarksheet: data['highschool_marksheet'] as String?,
        highschoolCertificate: data['highschool_certificate'] as String?,
        formalPhoto: data['formal_photo'] as String?,
        localIdCard: data['local_id_card'] as String?,
        passportFront: data['passport_front'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'highschool_marksheet': highschoolMarksheet,
        'highschool_certificate': highschoolCertificate,
        'formal_photo': formalPhoto,
        'local_id_card': localIdCard,
        'passport_front': passportFront,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Document].
  factory Document.fromJson(String data) {
    return Document.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Document] to a JSON string.
  String toJson() => json.encode(toMap());

  Document copyWith({
    dynamic passportInfo,
    String? highschoolMarksheet,
    String? highschoolCertificate,
    String? formalPhoto,
    String? localIdCard,
    String? passportFront,
  }) {
    return Document(
      highschoolMarksheet: highschoolMarksheet ?? this.highschoolMarksheet,
      highschoolCertificate:
          highschoolCertificate ?? this.highschoolCertificate,
      formalPhoto: formalPhoto ?? this.formalPhoto,
      localIdCard: localIdCard ?? this.localIdCard,
      passportFront: passportFront ?? this.passportFront,
    );
  }

  @override
  List<Object?> get props {
    return [
      highschoolMarksheet,
      highschoolCertificate,
      formalPhoto,
      localIdCard,
      passportFront,
    ];
  }
}
