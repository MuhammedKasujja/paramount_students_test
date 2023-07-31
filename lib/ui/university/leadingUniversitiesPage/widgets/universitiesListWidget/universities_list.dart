import 'package:flutter/material.dart';
import 'package:paramount_students/data/repository/leadingUniversities/model/universities_model.dart';
import 'package:paramount_students/ui/university/leadingUniversitiesPage/logic/leading_universities_logic.dart';
import 'package:paramount_students/ui/university/leadingUniversitiesPage/widgets/universitiesListWidget/custom_leading_universities_widget.dart';
import 'package:paramount_students/ui/university_profile/university_profile.dart';

class UniversitiesList extends StatefulWidget {
  final List<UniversityList> universityList;
  const UniversitiesList({
    Key? key,
    required this.universityList,
  }) : super(key: key);

  @override
  State<UniversitiesList> createState() => _UniversitiesListState();
}

class _UniversitiesListState extends State<UniversitiesList> {
  final LeadingUniveristiesLogic leadingUniLogic = LeadingUniveristiesLogic();

  List<UniversityList> universitiesList = [];
  // bool isRequestSuccessful = false;
  // bool isRequestInProgress = false;

  // late Timer updateRequiredData;

  // void neccessaryDataUpdate() {
  //   updateRequiredData = Timer.periodic(const Duration(), (timer) {
  //     if (isRequestSuccessful == false) {
  //       setState(() {
  //         universitiesList = leadingUniLogic.leadingUniList;
  //         isRequestInProgress = leadingUniLogic.isLeadingUniLoading;
  //         isRequestSuccessful = leadingUniLogic.isLeadingUniRequestSuccessful;
  //       });
  //       if (universitiesList.isNotEmpty) {
  //         debugPrint(
  //             'this is the image path: ${universitiesList[0].coverPhotoUrl}');
  //       }
  //     }
  //   });
  // }

  @override
  void initState() {
    // leadingUniLogic.init();
    // neccessaryDataUpdate();
    setState(() {
      universitiesList = widget.universityList;
    });
    super.initState();
  }

  @override
  void dispose() {
    // updateRequiredData.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('University list: $universitiesList');
    return universitiesList.isEmpty
        ? const Center(
            child: Text('No university yet'),
          )
        : ListView.builder(
            itemCount: universitiesList.length,
            itemBuilder: (context, index) {
              bool isThereAnyUniProgramCount = false;
              if (universitiesList[index].universityBachelorCount > 0 ||
                  universitiesList[index].universityDiplomaCount > 0 ||
                  universitiesList[index].universityMastersCount > 0 ||
                  universitiesList[index].universityPHDCount > 0) {
                isThereAnyUniProgramCount = true;
              }
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UniversityProfile(
                          universityId: universitiesList[index].id,
                        );
                      },
                    ),
                  );
                },
                child: CustomLeadingUniversitesWidget(
                  universityLocation: universitiesList[index].locationTitle,
                  universityName: universitiesList[index].name,
                  universityTutionFee: '${universitiesList[index].yearlyCost}',
                  universityBgImage: universitiesList[index].coverPhotoUrl,

                  uniGoogleMapDirFunctionality: () {},
                  universityBachelorCount:
                      universitiesList[index].universityBachelorCount,
                  universityDiplomaCount:
                      universitiesList[index].universityDiplomaCount,
                  universityLogoImage:
                      universitiesList[index].universityLogoImage,
// =======
//                       universitiesList[index].universityDiplomaCount ?? 0,
//                   universityLogoImage: universitiesList[index]
//                           .universityLogoImage ??
//                       'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/phi0fdpgiwsl6jfqrcvw',
// >>>>>>> chuks
                  universityMastersCount:
                      universitiesList[index].universityMastersCount,
                  universityPHDCount:
                      universitiesList[index].universityPHDCount,
                  universityStatus: universitiesList[index].type,
                  isThereAnyUniProgramCount: isThereAnyUniProgramCount,
                ),
              );
            },
          );
  }
}
