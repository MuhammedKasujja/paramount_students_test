import 'package:flutter_html/flutter_html.dart';
import 'package:paramount_students/models/store.dart';


class NotificationModel extends Store{
  String? nHeadline;
  Html? nBody;
  int? id;
  bool isRead;
  String? ownerType;
  String? viewed;

  ///Recommend the use of timeago package
  DateTime? nTimeage;

  NotificationModel({
    this.nHeadline,
    this.isRead = false,
    this.nBody,
    this.nTimeage,
    this.viewed,
    this.id,
    this.ownerType,
  });

  Map<String, dynamic> toMap() => {
        "headline": nHeadline,
        'body': nBody!.data,
        'owner_type': ownerType,
        'viewed': viewed,
        'created_at': nTimeage,
        'id': id
      };

  @override
  void markAsRead(Map<String, dynamic> data) {
    isRead = true;
    super.markAsRead(data);
  }

  factory NotificationModel.fromMap(Map<String, dynamic> data) =>
      NotificationModel(
          nHeadline: data['headline'] as String,
          nBody: Html(data: data['body'] as String, style: {
            '*': Style(
                margin: Margins.only(left: 0),
                fontSize: FontSize.small,
                maxLines: null)
          }),
          ownerType: data['owner_type'] as String,
          viewed: data['viewed'] as String,
          nTimeage: data['created_at'] as DateTime,
          id: data['id'] as int);
}
