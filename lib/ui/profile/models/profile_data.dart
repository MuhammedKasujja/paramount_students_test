import 'package:paramount_students/app_utils/helper/helper.dart';

List<ListPrograms> profileState = [
  ListPrograms(name: "profile", id: false),
  ListPrograms(name: "contact", id: false),
  ListPrograms(name: "education", id: false),
  ListPrograms(name: "documents", id: false)
];

class ProfileDetailsModel {
  final String title;
  final String imagePath;
  bool isVisible;

  ProfileDetailsModel({
    required this.title,
    required this.imagePath,
    this.isVisible = false,
  });
}

List<ProfileDetailsModel> profileData = [
  ProfileDetailsModel(
    title: "Profile",
    imagePath: "profile_info.png",
    isVisible: false,
  )
];
