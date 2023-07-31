import 'package:paramount_students/ui/applications/models/program_res.dart';

class FacultyProgramsModel {
  FacultyProgramsModel({
    required this.data,
  });
  late final Data data;

  static FacultyProgramsModel fromJson(Map<String, dynamic> json) {
    return FacultyProgramsModel(data: Data.fromJson(json['data']));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
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
  late final FacultyProgramsResponseBody responseBody;

  static Data fromJson(Map<String, dynamic> json) {
    return Data(
      error: json['error'],
      statusCode: json['statusCode'],
      responseBody: FacultyProgramsResponseBody.fromJson(json['responseBody']),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['statusCode'] = statusCode;
    _data['responseBody'] = responseBody.toJson();
    return _data;
  }
}

class FacultyProgramsResponseBody {
  FacultyProgramsResponseBody({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final List<Program> data;
  late final String firstPageUrl;
  late final dynamic from;
  late final int lastPage;
  late final String lastPageUrl;
  late final List<Link> links;
  late final dynamic nextPageUrl;
  late final String path;
  late final int perPage;
  late final dynamic prevPageUrl;
  late final dynamic to;
  late final int total;

  static FacultyProgramsResponseBody fromJson(Map<String, dynamic> json) {
    return FacultyProgramsResponseBody(
      currentPage: json['current_page'],
      data: List.from(json['data']).map((e) => Program.fromJson(e)).toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: List.from(json['links']).map((e) => Link.fromJson(e)).toList(),
      nextPageUrl: json['nextPageUrl'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prevPageUrl'],
      to: json['to'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    _data['links'] = links.map((e) => e.toJson()).toList();
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}
