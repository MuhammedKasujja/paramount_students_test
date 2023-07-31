import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:either_dart/either.dart';
import 'package:paramount_students/core/api/base_api.dart';
import 'package:paramount_students/data/repository/notification/notifs_repo_interface.dart';
import 'package:paramount_students/data/response/base_response.dart';
import 'package:paramount_students/data/response/notification/notif_view_res.dart';

class NotifsRepo implements NotifsRepoIntl {
  late ApiService api;
  final String? token;

  NotifsRepo(this.token) {
    api = ApiService(token: token);
  }

  @override
  Future<Either<NotifRes, NotifRes>> notifsViewed(
      Map<String, dynamic> data) async {
    try {
      ResponseModel response = await api.call(
          method: HttpMethod.post,
          endpoint: 'notifications/mark_as_read',
          protected: true,
          reqBody: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Value Right: ${response.data}');
        return Right(NotifRes.fromMap(response.data));
      } else {
        log('Value left: ${response.data}');
        return Left(NotifRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(NotifRes.fromJson(ex.toString()));
    }
  }

  @override
  Future<Either<NotifRes, NotifRes>> getNotifs(String userId) async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.get,
        endpoint: 'notifications/$userId',
        protected: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Value Right: ${response.data}');
        return Right(NotifRes.fromMap(response.data));
      } else {
        log('Value left: ${response.data}');
        return Left(NotifRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(NotifRes.fromJson(ex.toString()));
    }
  }
}
