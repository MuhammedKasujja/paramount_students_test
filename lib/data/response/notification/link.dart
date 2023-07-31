import 'dart:convert';

import 'package:equatable/equatable.dart';

class Link extends Equatable {
  final String? url;
  final String? label;
  final bool? active;

  const Link({this.url, this.active, this.label});

  Map<String, dynamic> toMap() =>
      {'url': url, 'label': label, 'active': active};

  static List<Link> fromList(List<dynamic> data) => data
      .map((linkObj) => Link(
            url: linkObj['url'] as String?,
            label: linkObj['label'] as String?,
            active: linkObj['active'] as bool?,
          ))
      .toList();

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

  Link copyWith({String? url, String? label, bool? active}) {
    return Link(
        url: url ?? this.url,
        active: active ?? this.active,
        label: label ?? this.label);
  }

  @override
  List<Object?> get props {
    return [url, label, active];
  }
}
