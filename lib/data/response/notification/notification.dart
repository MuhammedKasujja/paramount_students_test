import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Notifs extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final List<dynamic>? ownerType;
  final List<dynamic>? ownerId;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final String? viewed;
  final String? studentViewed;
  final String? highSchoolViewed;
  final String? univeristyViewed;

  const Notifs({
    this.createdAt,
    this.description,
    this.highSchoolViewed,
    this.ownerId,
    this.ownerType,
    this.studentViewed,
    this.title,
    this.viewed,
    this.univeristyViewed,
    this.updatedAt,
    this.id,
  });

  factory Notifs.fromMap(Map<String, dynamic> data) => Notifs(
        id: data['id'] as int?,
        createdAt:
            DateFormat('dd MMMM, yyyy').parse(data['created_at'] as String),
        studentViewed: data['student_viewed'] as String?,
        highSchoolViewed: data['highschool_viewed'] as String?,
        description: data['description'] as String?,
        univeristyViewed: data['univeristy_viewed'] as String?,
        ownerId: data['owner_id'] as List<dynamic>?,
        ownerType: data['owner_type'] as List<dynamic>?,
        title: data['title'] as String?,
        viewed: data['viewed'] as String?,
        updatedAt: DateTime.tryParse(
            data['updated_at'] ?? DateTime.now().toIso8601String()),
      );

  static List<Notifs> fromList(List<dynamic> data) => data
      .map((notifObj) => Notifs(
            id: notifObj['id'] as int?,
            createdAt: DateFormat('dd MMMM, yyyy')
                .parse(notifObj['created_at'] as String),
            studentViewed: notifObj['student_viewed'] as String?,
            highSchoolViewed: notifObj['highschool_viewed'] as String?,
            description: notifObj['description'] as String?,
            univeristyViewed: notifObj['univeristy_viewed'] as String?,
            ownerId: notifObj['owner_id'] as List<dynamic>?,
            ownerType: notifObj['owner_type'] as List<dynamic>?,
            title: notifObj['title'] as String?,
            viewed: notifObj['viewed'] as String?,
            updatedAt: DateTime.tryParse(
                notifObj['updated_at'] ?? DateTime.now().toIso8601String()),
          ))
      .toList();

  Map<String, dynamic> toMap() => {
        'created_at': createdAt,
        'id': id,
        'updated_at': updatedAt,
        'viewed': viewed,
        'title': title,
        'owner_type': ownerType,
        'owner_id': ownerId,
        'description': description,
        'university_viewed': univeristyViewed,
        'highschool_viewed': highSchoolViewed,
        'student_viewed': studentViewed
      };

  /// `dart:convert`
  ///
  /// Converts [Chat] to a JSON string.
  String toJson() => json.encode(toMap());

  Notifs copyWith(
      String? studentViewed,
      String? highSchoolViewed,
      String? description,
      String? univeristyViewed,
      String? title,
      String? viewed,
      DateTime? createdAt,
      List<dynamic>? ownerType,
      List<dynamic>? ownerId,
      DateTime? updatedAt,
      int? id) {
    return Notifs(
      studentViewed: studentViewed ?? this.studentViewed,
      createdAt: createdAt ?? this.createdAt,
      viewed: viewed ?? this.viewed,
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      highSchoolViewed: highSchoolViewed ?? this.highSchoolViewed,
      univeristyViewed: univeristyViewed ?? this.univeristyViewed,
      description: description ?? this.description,
      title: title ?? this.title,
      ownerId: ownerId ?? this.ownerId,
      ownerType: ownerType ?? this.ownerType,
    );
  }

  @override
  List<Object?> get props {
    return [
      createdAt,
      updatedAt,
      viewed,
      univeristyViewed,
      highSchoolViewed,
      description,
      title,
      ownerId,
      ownerType,
      studentViewed,
      id
    ];
  }
}
