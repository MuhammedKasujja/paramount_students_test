import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProgramApplicationModel extends Equatable {
  final int? userId;
  final int? programId;
  final Map<String, dynamic>? documents;

  const ProgramApplicationModel({
    this.userId,
    this.programId,
    this.documents,
  });

  factory ProgramApplicationModel.fromMap(Map<String, dynamic> data) {
    return ProgramApplicationModel(
      userId: data['user_id'] as int?,
      programId: data['program_id'] as int?,
      documents: data['documents'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'program_id': programId,
        'documents': documents,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProgramApplicationModel].
  factory ProgramApplicationModel.fromJson(String data) {
    return ProgramApplicationModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProgramApplicationModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ProgramApplicationModel copyWith({
    int? userId,
    int? programId,
    Map<String, dynamic>? documents,
  }) {
    return ProgramApplicationModel(
      userId: userId ?? this.userId,
      programId: programId ?? this.programId,
      documents: documents ?? this.documents,
    );
  }

  @override
  List<Object?> get props => [userId, programId, documents];
}
