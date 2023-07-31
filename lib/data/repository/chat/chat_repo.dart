import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:paramount_students/core/api/base_api.dart';
import 'package:paramount_students/data/repository/chat/chat_repo_interface.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/requests/chat/chat_form.dart';
import 'package:paramount_students/data/response/base_response.dart';
import 'package:paramount_students/data/response/chat/chat_view_res.dart';

class ChatRepo implements ChatRepoIntl {
  late ApiService api;
  final String? token;

  ChatRepo(this.token) {
    api = ApiService(token: token);
  }

  @override
  Future<Either<ChatRes, ChatRes>> sendChat(ChatFormModel chatFormModel) async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.post,
        endpoint: 'chat/send',
        reqBody: chatFormModel.toMap(),
        protected: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Value Right: ${response.data}');
        return Right(ChatRes.fromMap(response.data));
      } else {
        log('Value left: ${response.data}');
        return Left(ChatRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(ChatRes.fromJson(ex.toString()));
    }
  }

  @override
  Future<Either<ChatRes, ChatRes>> getContactList() async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.get,
        endpoint: 'chat',
        protected: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Value Right: ${response.data}');
        return Right(ChatRes.fromMap(response.data));
      } else {
        log('Value left: ${response.data}');
        return Left(ChatRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(ChatRes.fromJson(ex.toString()));
    }
  }

  @override
  Future<Either<ChatRes, ChatRes>> getChats(dynamic chatCode) async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.get,
        endpoint: 'chats?chat_code=$chatCode',
        protected: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Value Right: ${response.data}');
        return Right(ChatRes.fromMap(response.data));
      } else {
        log('Value left: ${response.data}');
        return Left(ChatRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(ChatRes.fromJson(ex.toString()));
    }
  }

  @override
  Future<Either<ChatRes, ChatRes>> uploadDocumentForm(
      DocumentUploadFormModel documentUploadFormModel) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
            documentUploadFormModel.additionalDocPath!,
            filename: documentUploadFormModel.additionalDocFileName),
        'folder_name': documentUploadFormModel.additionalDocFolderName,
      });
      final response = await api.call(
        method: HttpMethod.post,
        endpoint: "file_upload",
        formData: formData,
        protected: true,
        useFormData: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Value Right: ${response.data}');
        return Right(ChatRes.fromMap(response.data));
      } else {
        log('Value left: ${response.data}');
        return Left(ChatRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(ChatRes.fromJson(ex.toString()));
    }
  }
}
