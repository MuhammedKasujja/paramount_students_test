import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/repository/places/model/country_universities_model.dart';

class UniversityLocation {
  String assetImage;
  String name;
  int numOfUni;

  UniversityLocation(this.assetImage, this.name, this.numOfUni);
}

String defaultImagePath = 'assets/images/turkey.png';

class StudyPlaceUniversityWidget extends StatelessWidget {
  final Universities universitiesModel;


  const StudyPlaceUniversityWidget({Key? key, required this.universitiesModel})

      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: universitiesModel.coverPhotoUrl.isNotEmpty
            ? DecorationImage(
                image: CachedNetworkImageProvider(universitiesModel.coverPhotoUrl),
                fit: BoxFit.fill,
              )
            : DecorationImage(
                image: AssetImage(defaultImagePath),
                fit: BoxFit.fill,
              ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: appWidth(context) / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Colors.black12,
            ),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sText(universitiesModel.name,
                          weight: FontWeight.bold,
                          size: 12,
                          color: Colors.white),
                      SizedBox(
                        height: appHeight(context) * 0.001,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.school,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: appWidth(context) * 0.02,
                          ),
                          sText(
                              "${universitiesModel.type} Universities",
                              weight: FontWeight.w500,
                              size: 10,
                              color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
