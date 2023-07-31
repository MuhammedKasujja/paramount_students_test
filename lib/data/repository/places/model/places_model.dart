class PlacesModel {
  int id;
  String name;
  dynamic coverPhoto;
  int universitiesCount;

  PlacesModel({
    required this.id,
    required this.name,
    required this.coverPhoto,
    required this.universitiesCount,
  });

  static PlacesModel fromJson(Map<String, dynamic> json) {
    return PlacesModel(
      id: json['id'],
      name: json['name'],
      coverPhoto: json['cover_photo'],
      universitiesCount: json['universities_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['cover_photo'] = coverPhoto;
    data['universities_count'] = universitiesCount;
    return data;
  }
}
