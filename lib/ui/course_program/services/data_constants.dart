// // data_constants.dart
// import 'package:intl/intl.dart';

// String getUniversityName(Map<String, dynamic> fetchedData) {
//   return fetchedData['university']['name'];
// }

// String getCourseDuration(Map<String, dynamic> fetchedData) {
//   return fetchedData['program_duration'];
// }

// String getProgramName(Map<String, dynamic> fetchedData) {
//   return fetchedData['program_name'];
// }

// String getProgramCode(Map<String, dynamic> fetchedData) {
//   return fetchedData['program_code'];
// }

// List<String> getLearningMode(Map<String, dynamic> fetchedData) {
//   final learningModes = fetchedData['learning_mode'];
//   return learningModes;
// }

// String getstartDate(Map<String, dynamic> fetchedData) {
//   final admissionDeadlines = fetchedData['admission_deadlines'];

//   if (admissionDeadlines is List && admissionDeadlines.isNotEmpty) {
//     final firstDeadline = admissionDeadlines[0];
//     final startDate = firstDeadline['start_date'];

//     if (startDate is String) {
//       final parsedDate = DateTime.parse(startDate);
//       final formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
//       return formattedDate;
//     }
//   }

//   return 'No start date';
// }

// String getendDate(Map<String, dynamic> fetchedData) {
//   final admissionDeadlines = fetchedData['admission_deadlines'];

//   if (admissionDeadlines is List && admissionDeadlines.isNotEmpty) {
//     final firstDeadline = admissionDeadlines[0];
//     final endDate = firstDeadline['end_date'];

//     if (endDate is String) {
//       final parsedDate = DateTime.parse(endDate);
//       final formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
//       return formattedDate;
//     }
//   }

//   return 'No end date';
// }

// String getstudyType(Map<String, dynamic> fetchedData) {
//   final studyTypes = fetchedData['study_type'] as List<dynamic>;
//   return studyTypes.isNotEmpty ? studyTypes[0] : '';
// }

// String getstudyLanguage(Map<String, dynamic> fetchedData) {
//   final studyLanguages = fetchedData['study_language'] as List<dynamic>;
//   return studyLanguages.isNotEmpty ? studyLanguages[0] : '';
// }
