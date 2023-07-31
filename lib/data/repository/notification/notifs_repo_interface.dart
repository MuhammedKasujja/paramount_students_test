import 'package:either_dart/either.dart';
import 'package:paramount_students/data/response/notification/notif_view_res.dart';
import 'package:paramount_students/models/failure_model.dart';

abstract class NotifsRepoIntl {
  Future<Either<NotifRes, NotifRes>> getNotifs(String userId);
  Future<Either<NotifRes, NotifRes>> notifsViewed(Map<String, dynamic> data);
}
