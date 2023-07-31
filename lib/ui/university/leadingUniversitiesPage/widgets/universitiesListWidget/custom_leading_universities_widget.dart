import 'package:flutter/material.dart';

class CustomLeadingUniversitesWidget extends StatelessWidget {
  final String universityName;
  final String universityBgImage;
  final String universityLocation;
  final String universityTutionFee;
  final String universityStatus;
  final String universityLogoImage;
  final int universityBachelorCount;
  final int universityMastersCount;
  final int universityPHDCount;
  final int universityDiplomaCount;
  final bool isThereAnyUniProgramCount;
  final VoidCallback uniGoogleMapDirFunctionality;

  const CustomLeadingUniversitesWidget({
    Key? key,
    required this.universityLocation,
    required this.universityBgImage,
    required this.universityName,
    required this.universityTutionFee,
    required this.uniGoogleMapDirFunctionality,
    required this.universityBachelorCount,
    required this.universityDiplomaCount,
    required this.universityLogoImage,
    required this.universityMastersCount,
    required this.universityPHDCount,
    required this.universityStatus,
    required this.isThereAnyUniProgramCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110.0,
              height: 130.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    universityBgImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  universityProfile(
                    googleMapLinkFunctionality: uniGoogleMapDirFunctionality,
                    uniLocation: universityLocation,
                    uniLogo: universityLogoImage,
                    uniName: universityName,
                    uniStatus: universityStatus,
                  ),
                  isThereAnyUniProgramCount == true
                      ? customDivider()
                      : Container(),
                  isThereAnyUniProgramCount == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            programTitleCountWidget(
                              number: universityBachelorCount,
                              program: 'Bachelor',
                            ),
                            programTitleCountWidget(
                              number: universityMastersCount,
                              program: 'Masters',
                            ),
                            programTitleCountWidget(
                              number: universityPHDCount,
                              program: 'PHD',
                            ),
                            programTitleCountWidget(
                              number: universityDiplomaCount,
                              program: 'Diploma',
                            ),
                          ],
                        )
                      : Container(),
                  universityTutionFee.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customDivider(),
                            schoolTution(
                              tutionFee: universityTutionFee,
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: SizedBox(
        width: double.infinity,
        child: Divider(
          color: Colors.grey,
          height: 1.0,
          thickness: 1.0,
        ),
      ),
    );
  }

  Widget programTitleCountWidget(
      {required int number, required String program}) {
    return number != 0
        ? Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      '$number',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    program,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container();
  }

  Widget schoolTution({required String tutionFee}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Text(
              'Average Cost Per Year',
              style: TextStyle(
                color: Colors.black,
                fontSize: 11.0,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$$tutionFee/year',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11.0,
                  ),
                ),
                const SizedBox(
                  width: 70.0,
                  child: Divider(
                    color: Colors.amber,
                    thickness: 1.5,
                    height: 1.5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget universityProfile({
    required String uniLogo,
    required String uniName,
    required String uniLocation,
    required String uniStatus,
    required VoidCallback googleMapLinkFunctionality,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                uniLogo,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                uniName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50.0,
                    child: Text(
                      uniLocation,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: googleMapLinkFunctionality,
                    child: const Expanded(
                      child: Text(
                        'See in Map',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            uniStatus.isNotEmpty
                ? Text(
                    '$uniStatus University',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 11.0,
                    ),
                  )
                : Container(),
          ],
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: Icon(
              Icons.bookmarks,
              color: Colors.grey.shade300,
              size: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
