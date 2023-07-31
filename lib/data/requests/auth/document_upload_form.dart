import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:paramount_students/models/file.dart';

class DocumentUploadFormModel extends Equatable {
  final String? action;
  final int? userId;
  final PlatformFile? highschoolMarksheet;
  final PlatformFile? highschoolCertificate;
  final PlatformFile? formalPhoto;
  final PlatformFile? localIdCard;
  final PlatformFile? passportFront;
  final String? additionalDocPath;
  final String? additionalDocFileName;
  final String? additionalDocFolderName;

  const DocumentUploadFormModel({
    this.action,
    this.userId,
    this.highschoolMarksheet,
    this.highschoolCertificate,
    this.formalPhoto,
    this.localIdCard,
    this.passportFront,
    this.additionalDocPath,
    this.additionalDocFileName,
    this.additionalDocFolderName,
  });

  factory DocumentUploadFormModel.fromMap(Map<String, dynamic> data) {
    return DocumentUploadFormModel(
        action: data['action'] as String?,
        userId: data['user_id'] as int?,
        highschoolMarksheet: data['highschool_marksheet'] as dynamic,
        highschoolCertificate: data['highschool_certificate'] as dynamic,
        formalPhoto: data['formal_photo'] as dynamic,
        localIdCard: data['local_id_card'] as dynamic,
        passportFront: data['passport_front'] as dynamic,
        additionalDocPath: data['file_path'] as String,
        additionalDocFileName: data['file_name'] as String,
        additionalDocFolderName: data['folder_name'] as String);
  }

  Map<String, dynamic> toMap() => {
        'action': action,
        'user_id': userId,
        'highschool_marksheet': highschoolMarksheet,
        'highschool_certificate': highschoolCertificate,
        'formal_photo': formalPhoto,
        'local_id_card': localIdCard,
        'passport_front': passportFront,
        'file_path': additionalDocPath,
        'file_name': additionalDocFileName,
        'folder_name': additionalDocFolderName
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DocumentUploadFormModel].
  factory DocumentUploadFormModel.fromJson(String data) {
    return DocumentUploadFormModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DocumentUploadFormModel] to a JSON string.
  String toJson() => json.encode(toMap());

  DocumentUploadFormModel copyDocumentWith(
      {String? action,
      int? userId,
      dynamic highschoolMarksheet,
      dynamic highschoolCertificate,
      dynamic formalPhoto,
      dynamic localIdCard,
      dynamic passportFront,
      String? additionalDocFileName,
      String? additionalDocPath,
      String? additionalDocFolderName}) {
    return DocumentUploadFormModel(
        action: action ?? this.action,
        userId: userId ?? this.userId,
        highschoolMarksheet: highschoolMarksheet ?? this.highschoolMarksheet,
        highschoolCertificate:
            highschoolCertificate ?? this.highschoolCertificate,
        formalPhoto: formalPhoto ?? this.formalPhoto,
        localIdCard: localIdCard ?? this.localIdCard,
        passportFront: passportFront ?? this.passportFront,
        additionalDocPath: additionalDocPath ?? this.additionalDocPath,
        additionalDocFileName: additionalDocFileName ?? additionalDocFileName,
        additionalDocFolderName:
            additionalDocFolderName ?? this.additionalDocFolderName);
  }

  @override
  List<Object?> get props {
    return [
      action,
      userId,
      highschoolMarksheet,
      highschoolCertificate,
      formalPhoto,
      localIdCard,
      passportFront,
      additionalDocPath,
      additionalDocFileName,
      additionalDocFolderName
    ];
  }
}
