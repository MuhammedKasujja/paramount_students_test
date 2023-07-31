import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:paramount_students/ui/applications/models/models.dart';


class ResponseBody extends Equatable {
  final int? currentPage;
  final List<Program>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  const ResponseBody({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ResponseBody.fromMap(Map<String, dynamic> data) => ResponseBody(
        currentPage: data['current_page'] as int?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Program.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstPageUrl: data['first_page_url'] as String?,
        from: data['from'] as int?,
        lastPage: data['last_page'] as int?,
        lastPageUrl: data['last_page_url'] as String?,
        links: (data['links'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList(),
        nextPageUrl: data['next_page_url'] as dynamic,
        path: data['path'] as String?,
        perPage: data['per_page'] as int?,
        prevPageUrl: data['prev_page_url'] as dynamic,
        to: data['to'] as int?,
        total: data['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'current_page': currentPage,
        'data': data?.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': links?.map((e) => e.toJson()).toList(),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ResponseBody].
  factory ResponseBody.fromJson(String data) {
    return ResponseBody.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResponseBody] to a JSON string.
  String toJson() => json.encode(toMap());

  ResponseBody copyWith({
    int? currentPage,
    List<Program>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) {
    return ResponseBody(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      links: links ?? this.links,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props {
    return [
      currentPage,
      data,
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      links,
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to,
      total,
    ];
  }
}
