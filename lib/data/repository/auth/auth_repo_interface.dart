import 'package:either_dart/either.dart';
import 'package:paramount_students/data/requests/add_high_school.dart';
import 'package:paramount_students/data/requests/auth/contact_form_model.dart';
import 'package:paramount_students/data/requests/auth/country_model_class/country_model_class.dart';
import 'package:paramount_students/data/requests/auth/create_profile.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/requests/auth/education_form_model.dart';
import 'package:paramount_students/data/requests/auth/verify_otp.dart';
import 'package:paramount_students/data/response/profile_form_model/profile_form_model.dart';
import 'package:paramount_students/data/response/register_profile_res/register_profile_res.dart';
import 'package:paramount_students/data/response/user_model/user_model.dart';
import 'package:paramount_students/models/high_school_model/high_school_model.dart';
import 'package:paramount_students/models/state_model_class/state_model_class.dart';

import '../../../models/failure_model.dart';
import '../../requests/auth/signin_model.dart';

abstract class AuthRepositoryInterface {
  Future<Either<Failure, RegisterProfileRes>> createAccount(
      CreateProfile createProfile);
  Future<Either<Failure, RegisterProfileRes>> createContactForm(
      ContactFormModel contactFormModel);
  Future<Either<Failure, RegisterProfileRes>> createEducationForm(
      EducationFormModel educationFormModel);
  Future<Either<Failure, ProfileFormModel>> createDocumentForm(
      DocumentUploadFormModel documentUploadFormModel);

  Future<Either<Failure, Map<String, dynamic>>> signIn(SignInModel request);
  Future<Either<Failure, Map<String, dynamic>>> getGraduationYearList();
  Future<Either<Failure, Map<String, dynamic>>> getStudyLanguageList();
  Future<Either<Failure, List<HighSchoolModel>>> getHighSchoolList();
  Future<Either<Failure, List<CountryModelClass>>> countryList();
  Future<Either<Failure, List<StateModelClass>>> stateList(
      {required int countryId});
  Future<Either<Failure, UserModel>> verifyOTP(VerifyOtp verifyOTP);

  Future<Either<Failure, Map<String, dynamic>>> addHighSch(
      AddHighSchool addHighSchool);
}
