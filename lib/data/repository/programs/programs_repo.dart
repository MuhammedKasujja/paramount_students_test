import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:paramount_students/core/api/base_api.dart';
import 'package:paramount_students/data/repository/programs/programs_repo_interface.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/requests/programs/filtered_programs/filtered_programs.dart';
import 'package:paramount_students/data/requests/programs/program_application_model.dart';
import 'package:paramount_students/data/response/all_programs/all_programs.dart';
import 'package:paramount_students/data/response/base_response.dart';
import 'package:paramount_students/data/response/failure_response.dart';
import 'package:paramount_students/data/response/programs/program_app_res.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/applications/models/unversity_course.dart';
import 'package:paramount_students/models/failure_model.dart';

class ProgramsRepo implements ProgramRepoIntl {
  late ApiService api;
  final String? token;

  ProgramsRepo(this.token) {
    api = ApiService(token: token);
  }
  @override
  Future<Either<ProgramAppRes, ProgramAppRes>> programApplication(
      ProgramApplicationModel programApplicationModel) async {
    try {
      ResponseModel response = await api.call(
        method: HttpMethod.post,
        endpoint: 'program/apply',
        protected: true,
        reqBody: programApplicationModel.toMap(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Value Right: ${response.data}');
        return Right(ProgramAppRes.fromMap(response.data));
      } else {
        log('Value left: ${response.data}');
        return Left(ProgramAppRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(ProgramAppRes.fromJson(ex.toString()));
    }
  }

  @override
  Future<Either<ProgramAppRes, ProgramAppRes>> updateDocumentForm(
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
        return Right(ProgramAppRes.fromMap(response.data));
      } else {
        log('Value left: ${response.data}');
        return Left(ProgramAppRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(ProgramAppRes.fromJson(ex.toString()));
    }
  }

  @override
  Future<Either<ProgramAppRes, StudentAppliedPrograms>> fetchAppliedPrograms(String studentId) async {
    try {
      final response = await api.call(
        method: HttpMethod.get,
        endpoint: "applied_programs/$studentId",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log('Value Right @@@@@@=>: ${response.data['data']['responseBody']}');
        return Right(
            StudentAppliedPrograms.fromJson(response.data['responseBody']));
      } else {
        log('Value left: ${response.data}');
        return Left(ProgramAppRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(ProgramAppRes.fromJson(ex.toString()));
    }
  }

  @override
  Future<Either<Failure, AllPrograms>> allPrograms() async {
    try {
      log('Attemping to get all programs');
      final response = await api.call(
        method: HttpMethod.get,
        endpoint: "programs",
        protected: false,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        log('right programs gotten');

        AllPrograms data = AllPrograms.fromMap(response.response.data);

        return Right(data);
      } else {
        log('left');
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error, stackTrace) {
      log('Exception: $error - StackTrace: $stackTrace');
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, AllPrograms>> filteredPrograms(
      FilteredPrograms filteredPrograms) async {
    try {
      log('Attemping to get online programs');
      final response = await api.call(
          method: HttpMethod.post,
          endpoint: "programs_filter",
          protected: false,
          reqBody: filteredPrograms.toMap());

      if (response.statusCode == 201 || response.statusCode == 200) {
        log('right programs gotten');

        AllPrograms data = AllPrograms.fromMap(response.response.data);
        // log('lengh of data ${data.data!.responseBody!.data!.length}');
        return Right(data);
      } else {
        log('left');
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error, stackTrace) {
      log('Exception: $error - StackTrace: $stackTrace');
      return Left(DefaultFailure());
    }
  }
  
  @override
  Future<Either<ProgramAppRes, ProgramsPaginated>> fetchPrograms(ProgramState programState)async {
    try {
      final response = await api.call(
        method: HttpMethod.get,
        endpoint: "programs?status=${programState.text}",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log('Value Right @@@@@@=>: ${response.data['data']['responseBody']}');
        return Right(
            ProgramsPaginated.fromJson(response.data['data']['responseBody']));
      } else {
        log('Value left: ${response.data}');
        return Left(ProgramAppRes.fromMap(response.data));
      }
    } catch (ex, trace) {
      log('ERROR caught: $ex, with stackTrace: $trace');
      return Left(ProgramAppRes.fromJson(ex.toString()));
    }
  }
}
