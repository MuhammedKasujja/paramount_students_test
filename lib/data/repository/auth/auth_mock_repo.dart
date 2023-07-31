// import 'dart:async';

// import 'package:either_dart/either.dart';
// import 'package:paramount_students/data/requests/auth/create_profile.dart';
// import 'package:paramount_students/models/failure_model.dart';

// import '../../../core/api/base_api.dart';
// import '../../requests/auth/register_model.dart';
// import '../../requests/auth/signin_model.dart';
// import '../../response/base_response.dart';
// import 'auth_repo_interface.dart';

// class AuthMockRepository implements AuthRepositoryInterface {
//   late ApiService api;

//   AuthMockRepository() {
//     api = ApiService();
//   }

//   @override
//   Future<ResponseModel> createAccount(CreateProfile request) async {
//     /// TODO: Implement this
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<Failure, Map<String, dynamic>>> signIn(
//       SignInModel request) async {
//     await Future.delayed(const Duration(seconds: 3));
//     return const Right({
//       "userdata": {
//         "id": "1",
//         "full_name": "Ogundowole Raheem Opeyemi",
//         "father_name": "Ogundowole Tajudeen",
//         "mother_name": "Ogundowole Folakemi-Oni",
//         "dob": "1994-10-18",
//         "email": "oluwatayoadeyemi@yahoo.com",
//         "gender": "Male",
//         "password": "",
//         "unique_id": "20230118102513",
//         "phone": "2349033024846",
//         "citizen": "South Africa",
//         "country_residence": "Mozambique",
//         "city_region": "Ibadan Nigeria",
//         "home_address": "N6059AIsopakoIbadanOyostateNigeria",
//         "passport_info": null,
//         "high_school_country": "Nigeria",
//         "high_school_city": "Ibadan",
//         "high_school": "The Polytechnic, Ibadan",
//         "high_school_graduation_year": "2012",
//         "student_id_number": "2012232080058",
//         "high_school_majors": "Higher National Diploma",
//         "study_language": "Yoruba",
//         "highschool_marksheet": null,
//         "highschool_certificate": null,
//         "formal_photo": null,
//         "local_id_card": null,
//         "passport_front": null,
//         "created_at": "2023-01-18 16:15:28",
//         "updated_at": "2023-01-19 20:42:44"
//       }
//     });
//   }
// }
