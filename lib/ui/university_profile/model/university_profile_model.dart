class UniversityProfileModel {
  UniversityProfileModel({
    required this.id,
    this.walletNumber,
    required this.name,
    required this.type,
    this.uniqueId,
    required this.registeredDate,
    required this.address,
    required this.countryId,
    required this.stateId,
    required this.postalCode,
    required this.coverPhotoUrl,
    required this.locationTitle,
    required this.locationDescription,
    required this.mediaUrl,
    required this.audioUrl,
    required this.hotspotX,
    required this.hotspotY,
    required this.hotspotContent,
    required this.verification,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    this.overview,
    this.ranking,
    this.yearlyCost,
    required this.galleries,
    required this.virtualTours,
    required this.country,
    required this.city,
  });
  late final int id;
  late final dynamic walletNumber;
  late final String name;
  late final String type;
  late final dynamic uniqueId;
  late final String registeredDate;
  late final String address;
  late final String countryId;
  late final String stateId;
  late final String postalCode;
  late final String coverPhotoUrl;
  late final String locationTitle;
  late final String locationDescription;
  late final String mediaUrl;
  late final String audioUrl;
  late final int hotspotX;
  late final int hotspotY;
  late final String hotspotContent;
  late final String verification;
  late final int active;
  late final String createdAt;
  late final String updatedAt;
  late final dynamic overview;
  late final dynamic ranking;
  late final dynamic yearlyCost;
  late final List<String> galleries;
  late final List<String> virtualTours;
  late final String country;
  late final String city;

  static UniversityProfileModel fromJson(Map<String, dynamic> json) {
    return UniversityProfileModel(
      id: json['id'],
      walletNumber: json['walletNumber'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      uniqueId: json['uniqueId'] ?? '',
      registeredDate: json['registered_date'] ?? '',
      address: json['address'] ?? '',
      countryId: json['country_id'] ?? '',
      stateId: json['state_id'] ?? '',
      postalCode: json['postal_code'] ?? '',
      coverPhotoUrl: json['cover_photo_url'],
      locationTitle: json['location_title'] ?? '',
      locationDescription: json['location_description'] ?? '',
      mediaUrl: json['media_url'] ?? '',
      audioUrl: json['audio_url'] ?? '',
      hotspotX: json['hotspot_x'] ?? 0,
      hotspotY: json['hotspot_y'] ?? 0,
      hotspotContent: json['hotspot_content'] ?? '',
      verification: json['verification'] ?? '',
      active: json['active'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      overview: json['overview'] ?? '',
      ranking: json['ranking'] ?? '',
      yearlyCost: json['yearlyCost'] ?? '',
      galleries: List.castFrom<dynamic, String>(json['galleries']),
      virtualTours: List.castFrom<dynamic, String>(json['virtual_tours']),
      country: json['country'] ?? '',
      city: json['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['wallet_number'] = walletNumber;
    _data['name'] = name;
    _data['type'] = type;
    _data['unique_id'] = uniqueId;
    _data['registered_date'] = registeredDate;
    _data['address'] = address;
    _data['country_id'] = countryId;
    _data['state_id'] = stateId;
    _data['postal_code'] = postalCode;
    _data['cover_photo_url'] = coverPhotoUrl;
    _data['location_title'] = locationTitle;
    _data['location_description'] = locationDescription;
    _data['media_url'] = mediaUrl;
    _data['audio_url'] = audioUrl;
    _data['hotspot_x'] = hotspotX;
    _data['hotspot_y'] = hotspotY;
    _data['hotspot_content'] = hotspotContent;
    _data['verification'] = verification;
    _data['active'] = active;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['overview'] = overview;
    _data['ranking'] = ranking;
    _data['yearly_cost'] = yearlyCost;
    _data['galleries'] = galleries;
    _data['virtual_tours'] = virtualTours;
    _data['country'] = country;
    _data['city'] = city;
    return _data;
  }
}
