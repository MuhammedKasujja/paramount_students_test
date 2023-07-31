import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:paramount_students/data/requests/add_high_school.dart';
import 'package:paramount_students/data/requests/auth/contact_form_model.dart';
import 'package:paramount_students/data/requests/auth/country_model_class/country_model_class.dart';
import 'package:paramount_students/data/requests/auth/create_profile.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/requests/auth/education_form_model.dart';
import 'package:paramount_students/data/requests/auth/verify_otp.dart';
import 'package:paramount_students/data/response/failure_response.dart';
import 'package:paramount_students/data/response/profile_form_model/profile_form_model.dart';
import 'package:paramount_students/data/response/register_profile_res/register_profile_res.dart';
import 'package:paramount_students/data/response/user_model/user_model.dart';
import 'package:paramount_students/models/failure_model.dart';
import 'package:paramount_students/models/high_school_model/high_school_model.dart';
import 'package:paramount_students/models/state_model_class/state_model_class.dart';

import '../../../core/api/base_api.dart';
import '../../requests/auth/signin_model.dart';
import '../../response/base_response.dart';
import 'auth_repo_interface.dart';

class AuthRepository implements AuthRepositoryInterface {
  late ApiService api;

  AuthRepository() {
    api = ApiService();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signIn(
      SignInModel request) async {
    try {
      ResponseModel apiResponse = await api.call(
        method: HttpMethod.post,
        endpoint: "signin",
        reqBody: request.toJson(),
        protected: false,
      );
      if (apiResponse.statusCode == 200 || apiResponse.statusCode! == 201) {
        return Right(apiResponse.response.data);
      } else {
        return Left(FailureResponse(apiResponse.response).toDomain());
      }
    } catch (error, stackTrace) {
      log('error here $error and Stacktrace is $stackTrace');
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterProfileRes>> createAccount(
      CreateProfile createProfile) async {
    try {
      final response = await api.call(
        method: HttpMethod.post,
        endpoint: "create-student",
        reqBody: createProfile.toCreateProfile(),
        protected: false,
      );

      log('CreateAccountError=>${response.data}');
      if (response.statusCode == 201 || response.statusCode == 200) {
        log('succ');
        return Right(RegisterProfileRes.fromMap(response.data));
      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error) {
      log('error here $error');
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterProfileRes>> createContactForm(
      ContactFormModel contactFormModel) async {
    try {
      log('Attempting to send request');
      final response = await api.call(
        method: HttpMethod.post,
        endpoint: "create-student",
        reqBody: contactFormModel.toMap(),
        protected: false,
      );

      log('statuscode: ${response.statusCode}, body: ${response.data}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(RegisterProfileRes.fromMap(response.data));
      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error) {
      log('error here $error');
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterProfileRes>> createEducationForm(
      EducationFormModel educationFormModel) async {
    try {
      final response = await api.call(
        method: HttpMethod.post,
        endpoint: "create-student",
        reqBody: educationFormModel.toMap(),
        protected: false,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(RegisterProfileRes.fromMap(response.data));
      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error) {
      log('error here $error');
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, ProfileFormModel>> createDocumentForm(
      DocumentUploadFormModel documentUploadFormModel) async {
    try {
      FormData formData = FormData.fromMap({
        'action': documentUploadFormModel.action,
        'user_id': documentUploadFormModel.userId,
        'highschool_marksheet': await MultipartFile.fromFile(
            documentUploadFormModel.highschoolMarksheet!.path!,
            filename: documentUploadFormModel.highschoolMarksheet!.name),
        'highschool_certificate': await MultipartFile.fromFile(
            documentUploadFormModel.highschoolCertificate!.path!,
            filename: documentUploadFormModel.highschoolCertificate!.name),
        'formal_photo': await MultipartFile.fromFile(
            documentUploadFormModel.formalPhoto!.path!,
            filename: documentUploadFormModel.formalPhoto!.name),
        'local_id_card': await MultipartFile.fromFile(
            documentUploadFormModel.localIdCard!.path!,
            filename: documentUploadFormModel.localIdCard!.name),
        'passport_front': await MultipartFile.fromFile(
            documentUploadFormModel.passportFront!.path!,
            filename: documentUploadFormModel.passportFront!.name),
      });
      final response = await api.call(
        method: HttpMethod.post,
        endpoint: "create-student",
        formData: formData,
        protected: false,
        useFormData: true,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Right(ProfileFormModel.fromProfileFormModel(response.data));
      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error) {
      log('error here $error');
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getGraduationYearList() async {
    try {
      final response = await api.call(
        method: HttpMethod.get,
        endpoint: "",
        protected: false,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        return Right(data);
      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error) {
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getStudyLanguageList() async {
    try {
      final response = await api.call(
        method: HttpMethod.get,
        endpoint: "",
        protected: false,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        return Right(data);
      } else {
        return Left(FailureResponse(response.response).toDomain());
      }
    } catch (error) {
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, List<HighSchoolModel>>> getHighSchoolList() async {
    try {
      final response = await api.call(
        method: HttpMethod.get,
        endpoint: "get-highschools",
        protected: false,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        List<HighSchoolModel> data = List<HighSchoolModel>.from(
                response.response.data.map((x) => HighSchoolModel.fromMap(x)))
            .toList();

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
  Future<Either<Failure, List<CountryModelClass>>> countryList() async {
    try {
      log('Attemping to get countries');
      final response = await api.call(
        method: HttpMethod.get,
        endpoint: "countries",
        protected: false,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        log('right ');

        List<CountryModelClass> data = List<CountryModelClass>.from(
                response.response.data.map((x) => CountryModelClass.fromMap(x)))
            .toList();

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
  Future<Either<Failure, List<StateModelClass>>> stateList(
      {required int countryId}) async {
    try {
      log('Attemping to get state');
      final response = await api.call(
        method: HttpMethod.get,
        endpoint: "state/$countryId",
        protected: false,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        List<StateModelClass> data = List<StateModelClass>.from(
                response.response.data.map((x) => StateModelClass.fromMap(x)))
            .toList();

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
  Future<Either<Failure, UserModel>> verifyOTP(VerifyOtp verifyOTP) async {
    try {
      ResponseModel apiResponse = await api.call(
        method: HttpMethod.post,
        endpoint: "sendOTP",
        reqBody: verifyOTP.toMap(),
        protected: false,
      );
      if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
        // return Right(apiResponse.response.data);
        return Right(UserModel.fromMap(apiResponse.response.data));
      } else {
        return Left(FailureResponse(apiResponse.response).toDomain());
      }
    } catch (error, stackTrace) {
      log('error in otp here $error and Stacktrace is $stackTrace');
      return Left(DefaultFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addHighSch(
      AddHighSchool addHighSchool) async {
    try {
      ResponseModel apiResponse = await api.call(
        method: HttpMethod.post,
        endpoint: "create-highschool",
        reqBody: addHighSchool.toMap(),
        protected: false,
      );
      if (apiResponse.statusCode == 200 || apiResponse.statusCode == 201) {
        return Right(apiResponse.response.data);
      } else {
        return Left(FailureResponse(apiResponse.response).toDomain());
      }
    } catch (error, stackTrace) {
      log('error in otp here $error and Stacktrace is $stackTrace');
      return Left(DefaultFailure());
    }
  }
}
