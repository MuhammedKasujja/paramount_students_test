import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/ui/base/base_view.dart';
import 'package:paramount_students/ui/profile/models/profile_data.dart';
import 'package:paramount_students/ui/profile/view_model/profile_view_model.dart';
import 'package:paramount_students/ui/profile/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
        model: ProfileViewModel(),
        onModelReady: (p0) => p0.init(),
        onDispose: (p0) => p0.dispose(),
        builder: (context, model, child) {
          return Scaffold(
            body: NestedScrollView(
              physics: const ClampingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  ProfileAppBar(model: model!),
                ];
              },
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: profileState.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (profileState[index].id) {
                                      profileState[index].id = false;
                                    } else {
                                      profileState[index].id = true;
                                    }
                                  });
                                },
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  elevation: 2,
                                  shadowColor: Colors.grey[100],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Row(
                                      children: [
                                        displayLocalImage("profile_info.png",
                                            radius: 0),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: sText("Profile",
                                              weight: FontWeight.bold,
                                              size: 16),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          child: displayLocalImage(
                                              !profileState[index].id
                                                  ? "arrow_down.png"
                                                  : "arrow_up.png",
                                              radius: 0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              profileState[index].id
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        profileInfo(context,
                                            type: "Father's Name",
                                            name: model!.userData.fatherName!
                                                    .isEmpty
                                                ? "Paramount"
                                                : model.userData.fatherName!),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Mother's Name",
                                            name: model.userData.motherName!
                                                    .isEmpty
                                                ? "Paramount"
                                                : model.userData.motherName!),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Date of Birth",
                                            name: model.userData.dob!.isEmpty
                                                ? "01-06-1999"
                                                : model.userData.dob!),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Gender",
                                            name: model.userData.gender!.isEmpty
                                                ? "M"
                                                : model.userData.gender![0]),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 40,
                                    )
                            ],
                          );
                        } else if (index == 1) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (profileState[index].id) {
                                      profileState[index].id = false;
                                    } else {
                                      profileState[index].id = true;
                                    }
                                  });
                                },
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  elevation: 2,
                                  shadowColor: Colors.grey[100],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Row(
                                      children: [
                                        displayLocalImage("contact_info.png",
                                            radius: 0),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: sText("Contact",
                                              weight: FontWeight.bold,
                                              size: 16),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          child: displayLocalImage(
                                              !profileState[index].id
                                                  ? "arrow_down.png"
                                                  : "arrow_up.png",
                                              radius: 0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              profileState[index].id
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        profileInfo(context,
                                            type: "Mobile",
                                            name: model!.userData.phone == null
                                                ? "123456789"
                                                : model.userData.phone),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Citizenship",
                                            name: model.userData.contact!
                                                    .citizen!.isEmpty
                                                ? "Nigerian"
                                                : model.userData.contact!
                                                    .citizen!),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(
                                          context,
                                          type: "Email",
                                          name: model.userData.email!.isEmpty
                                              ? "help@paramountstudents.com"
                                              : model.userData.email!,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "City/Province/State",
                                            name: model.userData.contact!
                                                    .cityRegion!.isEmpty
                                                ? "Nigerian"
                                                : '${model.userData.contact!.cityRegion!}, ${model.userData.contact!.countryResidence!}'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Home Address",
                                            name: model.userData.contact!
                                                    .homeAddress!.isEmpty
                                                ? "Nigerian"
                                                : model.userData.contact!
                                                    .homeAddress!),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Postal Code",
                                            name: model.userData.contact!
                                                        .postalCode ==
                                                    null
                                                ? '123456789'
                                                : model.userData.contact!
                                                    .postalCode
                                                    .toString()),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Passport ID",
                                            name: model.userData.nationalId ??
                                                '123456789'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 40,
                                    )
                            ],
                          );
                        } else if (index == 2) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (profileState[index].id) {
                                      profileState[index].id = false;
                                    } else {
                                      profileState[index].id = true;
                                    }
                                  });
                                },
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  elevation: 2,
                                  shadowColor: Colors.grey[100],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Row(
                                      children: [
                                        displayLocalImage("edu_info.png",
                                            radius: 0),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: sText("Education",
                                              weight: FontWeight.bold,
                                              size: 16),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          child: displayLocalImage(
                                              !profileState[index].id
                                                  ? "arrow_down.png"
                                                  : "arrow_up.png",
                                              radius: 0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              profileState[index].id
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        profileInfo(context,
                                            type: "High School Country",
                                            name: model!.userData.education!
                                                    .highSchoolCountry ??
                                                'Paramount'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(
                                          context,
                                          type: "City",
                                          name: model.userData.education!
                                                  .highSchoolCity ??
                                              'Paramount',
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "High School",
                                            name: model.userData.education!
                                                    .highSchool ??
                                                'Paramount'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Year of Graduation",
                                            name: model.userData.education!
                                                        .highSchoolGraduationYear ==
                                                    null
                                                ? 'Paramount'
                                                : model.userData.education!
                                                    .highSchoolGraduationYear
                                                    .toString()),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Student ID:",
                                            name: model.userData.education!
                                                        .studentIdNumber ==
                                                    null
                                                ? 'Paramount'
                                                : model.userData.education!
                                                    .studentIdNumber
                                                    .toString()),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Major",
                                            name: model.userData.education!
                                                    .highSchoolMajors ??
                                                'MCE'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        profileInfo(context,
                                            type: "Study Language",
                                            name: model.userData.education!
                                                    .studyLanguage ??
                                                'Paramount'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 40,
                                    )
                            ],
                          );
                        } else if (index == 3) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (profileState[index].id) {
                                      profileState[index].id = false;
                                    } else {
                                      profileState[index].id = true;
                                    }
                                  });
                                },
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  elevation: 2,
                                  shadowColor: Colors.grey[100],
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Row(
                                      children: [
                                        displayLocalImage("doc_info.png",
                                            radius: 0),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: sText("Documents",
                                              weight: FontWeight.bold,
                                              size: 16),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          child: displayLocalImage(
                                              !profileState[index].id
                                                  ? "arrow_down.png"
                                                  : "arrow_up.png",
                                              radius: 0),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              profileState[index].id
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              displayLocalImage(
                                                  "doc_upload.png",
                                                  radius: 0),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              sText(
                                                  "High school grade marksheet",
                                                  color: Colors.black,
                                                  size: 14),
                                              Expanded(child: Container()),
                                              model!.userData.document!
                                                          .highschoolMarksheet ==
                                                      null
                                                  ? const Icon(Icons.close,
                                                      color: psError)
                                                  : const VerifiedButton()
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              displayLocalImage(
                                                  "doc_upload.png",
                                                  radius: 0),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              sText("High School Certificate",
                                                  color: Colors.black,
                                                  size: 14),
                                              Expanded(child: Container()),
                                              model.userData.document!
                                                          .highschoolCertificate ==
                                                      null
                                                  ? const Icon(Icons.close,
                                                      color: psError)
                                                  : const VerifiedButton()
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              displayLocalImage(
                                                  "doc_upload.png",
                                                  radius: 0),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              sText("Formal Photo",
                                                  color: Colors.black,
                                                  size: 14),
                                              Expanded(child: Container()),
                                              model.userData.document!
                                                          .formalPhoto ==
                                                      null
                                                  ? const Icon(Icons.close,
                                                      color: psError)
                                                  : const VerifiedButton()
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              displayLocalImage(
                                                  "doc_upload.png",
                                                  radius: 0),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              sText("Local ID Card",
                                                  color: Colors.black,
                                                  size: 14),
                                              Expanded(child: Container()),
                                              model.userData.document!
                                                          .localIdCard ==
                                                      null
                                                  ? const Icon(Icons.close,
                                                      color: psError)
                                                  : const VerifiedButton()
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              displayLocalImage(
                                                  "doc_upload.png",
                                                  radius: 0),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              sText("Passport Front",
                                                  color: Colors.black,
                                                  size: 14),
                                              Expanded(child: Container()),
                                              model.userData.document!
                                                          .passportFront ==
                                                      null
                                                  ? const Icon(Icons.close,
                                                      color: psError)
                                                  : const VerifiedButton()
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 40,
                                    )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
