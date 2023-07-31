import 'dart:convert';

import 'package:equatable/equatable.dart';

class University extends Equatable {
  final int? id;
  final dynamic walletNumber;
  final String? name;
  final String? type;
  final dynamic uniqueId;
  final String? registeredDate;
  final String? address;
  final String? countryId;
  final String? stateId;
  final String? postalCode;
  final String? coverPhotoUrl;
  final String? locationTitle;
  final String? locationDescription;
  final String? mediaUrl;
  final String? audioUrl;
  final int? hotspotX;
  final int? hotspotY;
  final String? hotspotContent;
  final String? verification;
  final int? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic overview;
  final dynamic ranking;
  final dynamic yearlyCost;
  final List<dynamic>? galleries;
  final List<dynamic>? virtualTours;
  final String? country;
  final String? city;

  const University({
    this.id,
    this.walletNumber,
    this.name,
    this.type,
    this.uniqueId,
    this.registeredDate,
    this.address,
    this.countryId,
    this.stateId,
    this.postalCode,
    this.coverPhotoUrl,
    this.locationTitle,
    this.locationDescription,
    this.mediaUrl,
    this.audioUrl,
    this.hotspotX,
    this.hotspotY,
    this.hotspotContent,
    this.verification,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.overview,
    this.ranking,
    this.yearlyCost,
    this.galleries,
    this.virtualTours,
    this.country,
    this.city,
  });

  factory University.fromMap(Map<String, dynamic> data) => University(
        id: data['id'] as int?,
        walletNumber: data['wallet_number'] as dynamic,
        name: data['name'] as String?,
        type: data['type'] as String?,
        uniqueId: data['unique_id'] as dynamic,
        registeredDate: data['registered_date'] as String?,
        address: data['address'] as String?,
        countryId: data['country_id'] as String?,
        stateId: data['state_id'] as String?,
        postalCode: data['postal_code'] as String?,
        coverPhotoUrl: data['cover_photo_url'] as String?,
        locationTitle: data['location_title'] as String?,
        locationDescription: data['location_description'] as String?,
        mediaUrl: data['media_url'] as String?,
        audioUrl: data['audio_url'] as String?,
        hotspotX: data['hotspot_x'] as int?,
        hotspotY: data['hotspot_y'] as int?,
        hotspotContent: data['hotspot_content'] as String?,
        verification: data['verification'] as String?,
        active: data['active'] as int?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        overview: data['overview'] as dynamic,
        ranking: data['ranking'] as dynamic,
        yearlyCost: data['yearly_cost'] as dynamic,
        galleries: data['galleries'] as List<dynamic>?,
        virtualTours: data['virtual_tours'] as List<dynamic>?,
        country: data['country'] as String?,
        city: data['city'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'wallet_number': walletNumber,
        'name': name,
        'type': type,
        'unique_id': uniqueId,
        'registered_date': registeredDate,
        'address': address,
        'country_id': countryId,
        'state_id': stateId,
        'postal_code': postalCode,
        'cover_photo_url': coverPhotoUrl,
        'location_title': locationTitle,
        'location_description': locationDescription,
        'media_url': mediaUrl,
        'audio_url': audioUrl,
        'hotspot_x': hotspotX,
        'hotspot_y': hotspotY,
        'hotspot_content': hotspotContent,
        'verification': verification,
        'active': active,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'overview': overview,
        'ranking': ranking,
        'yearly_cost': yearlyCost,
        'galleries': galleries,
        'virtual_tours': virtualTours,
        'country': country,
        'city': city,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [University].
  factory University.fromJson(String data) {
    return University.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [University] to a JSON string.
  String toJson() => json.encode(toMap());

  University copyWith({
    int? id,
    dynamic walletNumber,
    String? name,
    String? type,
    dynamic uniqueId,
    String? registeredDate,
    String? address,
    String? countryId,
    String? stateId,
    String? postalCode,
    String? coverPhotoUrl,
    String? locationTitle,
    String? locationDescription,
    String? mediaUrl,
    String? audioUrl,
    int? hotspotX,
    int? hotspotY,
    String? hotspotContent,
    String? verification,
    int? active,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic overview,
    dynamic ranking,
    dynamic yearlyCost,
    List<dynamic>? galleries,
    List<dynamic>? virtualTours,
    String? country,
    String? city,
  }) {
    return University(
      id: id ?? this.id,
      walletNumber: walletNumber ?? this.walletNumber,
      name: name ?? this.name,
      type: type ?? this.type,
      uniqueId: uniqueId ?? this.uniqueId,
      registeredDate: registeredDate ?? this.registeredDate,
      address: address ?? this.address,
      countryId: countryId ?? this.countryId,
      stateId: stateId ?? this.stateId,
      postalCode: postalCode ?? this.postalCode,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      locationTitle: locationTitle ?? this.locationTitle,
      locationDescription: locationDescription ?? this.locationDescription,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      hotspotX: hotspotX ?? this.hotspotX,
      hotspotY: hotspotY ?? this.hotspotY,
      hotspotContent: hotspotContent ?? this.hotspotContent,
      verification: verification ?? this.verification,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      overview: overview ?? this.overview,
      ranking: ranking ?? this.ranking,
      yearlyCost: yearlyCost ?? this.yearlyCost,
      galleries: galleries ?? this.galleries,
      virtualTours: virtualTours ?? this.virtualTours,
      country: country ?? this.country,
      city: city ?? this.city,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      walletNumber,
      name,
      type,
      uniqueId,
      registeredDate,
      address,
      countryId,
      stateId,
      postalCode,
      coverPhotoUrl,
      locationTitle,
      locationDescription,
      mediaUrl,
      audioUrl,
      hotspotX,
      hotspotY,
      hotspotContent,
      verification,
      active,
      createdAt,
      updatedAt,
      overview,
      ranking,
      yearlyCost,
      galleries,
      virtualTours,
      country,
      city,
    ];
  }
}
