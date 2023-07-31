class UniversitiesModel {
  UniversitiesModel({
    required this.universityList,
  });
  late final List<UniversityList> universityList;

  static UniversitiesModel fromJson(Map<String, dynamic> json) {
    return UniversitiesModel(
        universityList: List.from(json['message'])
            .map((e) => UniversityList.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = universityList.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UniversityList {
  UniversityList({
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
    this.locationDescription,
    this.mediaUrl,
    this.audioUrl,
    this.hotspotX,
    this.hotspotY,
    this.hotspotContent,
    required this.verification,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    this.overview,
    this.ranking,
    this.yearlyCost,
    this.universityBachelorCount = 0,
    this.universityDiplomaCount = 0,
    this.universityMastersCount = 0,
    this.universityPHDCount = 0,
    required this.galleries,
    required this.virtualTours,
    required this.country,
    required this.city,
    this.universityLogoImage = '',
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
  late final String? locationDescription;
  late final String? mediaUrl;
  late final String? audioUrl;
  late final int? hotspotX;
  late final int? hotspotY;
  late final String? hotspotContent;
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
  late final String universityLogoImage;
  late final int universityBachelorCount;
  late final int universityDiplomaCount;
  late final int universityMastersCount;
  late final int universityPHDCount;

  static UniversityList fromJson(Map<String, dynamic> json) {
    return UniversityList(
      id: json['id'],
      walletNumber: json['wallet_number'],
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      uniqueId: json['unique_id'] ?? '',
      registeredDate: json['registered_date'] ?? '',
      address: json['address'] ?? '',
      countryId: json['country_id'] ?? '',
      stateId: json['state_id'] ?? '',
      postalCode: json['postal_code'] ?? '',
      coverPhotoUrl: json['cover_photo_url'] ?? '',
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
      yearlyCost: json['yearly_cost'] ?? 0,
      // universityLogoImage: json['university_logo_image'] ?? '',
      // universityBachelorCount: json['university_bachelor_count'] ?? 0,
      // universityDiplomaCount: json['university_diploma_count'] ?? 0,
      // universityMastersCount: json['university_masters_ount'] ?? 0,
      // universityPHDCount: json['university_phd_count'] ?? 0,
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
