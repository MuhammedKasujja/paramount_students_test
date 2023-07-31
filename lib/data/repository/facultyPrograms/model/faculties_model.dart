class FacultiesModel {
  FacultiesModel({
    required this.data,
  });
  late final Data data;

  static FacultiesModel fromJson(Map<String, dynamic> json) {
    return FacultiesModel(data: Data.fromJson(json['data']));
  }

  Map<String, dynamic> toJson() {
    final mapData = <String, dynamic>{};
    mapData['data'] = data.toJson();
    return mapData;
  }
}

class Data {
  Data({
    required this.error,
    required this.statusCode,
    required this.responseBody,
  });
  late final bool error;
  late final int statusCode;
  late final List<FacultiesListData> responseBody;

  static Data fromJson(Map<String, dynamic> json) {
    return Data(
        error: json['error'],
        statusCode: json['statusCode'],
        responseBody: List.from(json['responseBody'])
            .map((e) => FacultiesListData.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['error'] = error;
    data['statusCode'] = statusCode;
    data['responseBody'] = responseBody.map((e) => e.toJson()).toList();
    return data;
  }
}

class FacultiesListData {
  FacultiesListData({
    required this.id,
    required this.name,
    required this.code,
    this.description,
    this.coverPhotoUrl,
    this.createdAt,
    this.updatedAt,
    this.icon,
  });
  late final int id;
  late final String name;
  late final String code;
  late final dynamic description;
  late final dynamic coverPhotoUrl;
  late final dynamic createdAt;
  late final dynamic updatedAt;
  late final dynamic icon;

  static FacultiesListData fromJson(Map<String, dynamic> json) {
    return FacultiesListData(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      description: json['description'],
      coverPhotoUrl: json['coverPhotoUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['description'] = description;
    data['cover_photo_url'] = coverPhotoUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['icon'] = icon;
    return data;
  }
}
