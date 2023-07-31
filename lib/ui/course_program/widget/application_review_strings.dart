import 'package:hive_flutter/adapters.dart';

import 'package:paramount_students/app_utils/countries/countries.dart';
import 'package:paramount_students/app_utils/countries/country_model.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';

//retrieving reference to opened hive box
final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

final userMap = localDB.getUser().toMap();

final List<Country> countries = Countries.countryList;

final String passportIDStr = userMap['contact']['passport_info'] == null
? 'n/a' : userMap['contact']['passport_info']['passport_id'];
final String issueDateStr = userMap['contact']['passport_info'] == null
? 'n/a' : userMap['contact']['passport_info']['issue_date'];
final String expiryDateStr = userMap['contact']['passport_info'] == null
? 'n/a' : userMap['contact']['passport_info']['expiry_date'];
final String countryLocalIDStr = userMap['contact']['passport_info'] == null
? 'n/a' : userMap['contact']['passport_info']['country_local_id'];

class ApplicationReviewStrings {
  final String fullName = userMap['full_name'];
  final String fatherName = userMap['father_name'];
  final String motherName = userMap['mother_name'];
  final String dob = userMap['dob'];
  final String gender = userMap['gender'];
  final String email = userMap['email'];
  final String highSchCountry = userMap['education']['high_school_country'];
  final String highSch = userMap['education']['high_school'] ??
      userMap['education']['high_school_id'];
  final String gradYr =
      userMap['education']['high_school_graduation_year'].toString();
  final String studyLang = userMap['education']['study_language'];
  final String highSchMajors = userMap['education']['high_school_majors'];
  final String studentId = userMap['education']['student_id_number'].toString();
  final String highSchCty = userMap['education']['high_school_city'];
  final String phone = userMap['contact']['phone'];
  final String citizen = userMap['contact']['citizen'];
  final String countryRes = userMap['contact']['country_residence'];
  final String cityReg = userMap['contact']['city_region'];
  final String homeAdd = userMap['contact']['home_address'];
  final String postalCode = userMap['contact']['postal_code'] ?? '---';
  final String countryLocalId = countryLocalIDStr;
  final String passportId = passportIDStr;
  final String issueDate = issueDateStr;
  final String expiryDate = expiryDateStr;
  final String highSchFlagPath = countries
      .firstWhere((c) => c.name == userMap['education']['high_school_country'])
      .flagPath!;
  final String citizenFlagPath = countries
      .firstWhere((c) => c.name == userMap['contact']['country_residence'])
      .flagPath!;
  final String dialCode = countries
      .firstWhere((c) => c.name == userMap['contact']['country_residence'])
      .dialCode!;
}
