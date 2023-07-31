import 'dart:convert';

import 'package:equatable/equatable.dart';

import './link.dart';
import './notification.dart';

class Message extends Equatable {
  final List<Notifs>? data;
  final int? currentPage;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? previousPageUrl;
  final int? to;
  final int? total;

  const Message(
      {this.data,
      this.currentPage,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.previousPageUrl,
      this.to,
      this.total});

  factory Message.fromMap(Map<String, dynamic> data) => Message(
      data: Notifs.fromList(data['data'] as List<dynamic>),
      currentPage: data['current_page'] as int?,
      to: data['to'] as int?,
      path: data['path'] as String?,
      total: data['total'] as int?,
      perPage: data['per_page'] as int?,
      nextPageUrl: data['next_page_url'] as String?,
      previousPageUrl: data['prev_page_url'] as String?,
      links: Link.fromList(data['links'] as List<dynamic>),
      lastPage: data['last_page'] as int?,
      lastPageUrl: data['last_page_url'] as String?,
      from: data['from'] as int?,
      firstPageUrl: data['first_page_url'] as String?);

  Map<String, dynamic> toMap() => {
        'data': data,
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page_url': lastPageUrl,
        "last_page": lastPage,
        'next_page_url': nextPageUrl,
        'links': links,
        'per_page': perPage,
        'path': path,
        'total': total,
        'to': to,
        'current_page': currentPage,
        'prev_page_url': previousPageUrl
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Message].
  // factory Message.fromJson(String data) {
  //   return Message.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  /// `dart:convert`
  ///
  /// Converts [Message] to a JSON string.
  String toJson() => json.encode(toMap());

  Message copyWith(
      {List<Notifs>? data,
      int? to,
      int? from,
      String? previousPageUrl,
      String? nextPageUrl,
      int? lastPage,
      String? lastPageUrl,
      int? currentPage,
      String? firstPageUrl,
      List<Link>? links,
      String? path,
      int? total,
      int? perPage}) {
    return Message(
      data: data ?? this.data,
      to: to ?? this.to,
      from: from ?? this.from,
      previousPageUrl: previousPageUrl ?? this.previousPageUrl,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      currentPage: currentPage ?? this.currentPage,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      links: links ?? this.links,
      path: path ?? this.path,
      total: total ?? this.total,
      perPage: perPage ?? this.perPage,
    );
  }

  @override
  List<Object?> get props {
    return [
      data,
      firstPageUrl,
      lastPage,
      currentPage,
      lastPageUrl,
      from,
      links,
      path,
      total,
      perPage,
      previousPageUrl,
      nextPageUrl,
      to
    ];
  }
}
