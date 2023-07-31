import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/core/constants.dart';
import 'package:paramount_students/ui/VirtualTour/view/virtual_tour.dart';
import 'package:paramount_students/ui/course_program/widget/expandable_container_widget.dart';
import 'package:http/http.dart' as http;
import 'package:paramount_students/ui/university_profile/model/university_profile_model.dart';

import '../../app_utils/helper/helper.dart';
import '../../app_utils/styles/texts.dart';

class UniversityProfile extends StatefulWidget {
  final int universityId;
  const UniversityProfile({
    super.key,
    required this.universityId,
  });

  @override
  State<UniversityProfile> createState() => _UniversityProfileState();
}

class _UniversityProfileState extends State<UniversityProfile> {
  final PageController _pageController = PageController();
  final List<String> images = [
    'assets/images/uni1.png',
    'assets/images/uni2.png',
    'assets/images/uni3.png',
    'assets/images/uni3.png',
  ];
  Map<String, dynamic>? fetchedData;
  int _currentPage = 0;

  late Either<bool, UniversityProfileModel> universityResponseData;
  bool isRequestInProgress = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isRequestInProgress = true;
      Future.delayed(const Duration()).then((value) async {
        universityResponseData =
            await fetchData(universityId: widget.universityId);
      });
    });

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  Future<Either<bool, UniversityProfileModel>> fetchData(
      {required int universityId}) async {
    try {
      final Uri url =
          Uri.parse('${AppConstants.baseUrl}get-university/$universityId');
      final response = await http.get(url);

      print(
          'this is the fetched data from the api endpoint ${widget.universityId} ${response.statusCode}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        UniversityProfileModel profileModel =
            UniversityProfileModel.fromJson(data);
        setState(() {
          isRequestInProgress = false;
        });
        return Right(profileModel);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      setState(() {
        isRequestInProgress = false;
      });
      print('Error fetching data: $error');
      return const Left(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isRequestInProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : universityResponseData.isRight
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            child: CachedNetworkImage(
                              imageUrl:
                                  universityResponseData.right.coverPhotoUrl,
                              errorWidget: (context, url, error) => Container(),
                              height: 310.0,
                            ),
                          ),
                          Positioned(
                              top: 30,
                              left: 15,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: psWhite),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                ),
                              )),
                          Positioned(
                            top: 260,
                            left: 20,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: CachedNetworkImageProvider(
                                universityResponseData.right.coverPhotoUrl,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 340,
                            child: SizedBox(
                              height: 900,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        universityResponseData.right.name,
                                        style: PSTextStyle.universityName,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${universityResponseData.right.type} university | ${universityResponseData.right.city} | ${universityResponseData.right.country}',
                                          style: PSTextStyle.universityinfo,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: 28,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: psGrey3,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Center(
                                              child: Text(
                                                'See Map',
                                                style:
                                                    PSTextStyle.universityinfo,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Divider(
                                      color: psGrey1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Gallery',
                                        style: PSTextStyle.universitymoreinfo,
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        universityResponseData
                                            .right.galleries.length,
                                        (index) => Container(
                                          margin: const EdgeInsets.all(8.0),
                                          child: CachedNetworkImage(
                                            imageUrl: universityResponseData
                                                .right.galleries[index],
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(),
                                            progressIndicatorBuilder: (context,
                                                    url, progress) =>
                                                const CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  universityResponseData
                                          .right.galleries.isNotEmpty
                                      ? DotsIndicator(
                                          dotsCount: universityResponseData
                                              .right.galleries.length,
                                          position: _currentPage,
                                          decorator: const DotsDecorator(
                                            activeColor: psGrey1,
                                            spacing: EdgeInsets.all(2.0),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1600,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Divider(
                              color: psGrey1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Virtual Tour',
                                style: PSTextStyle.universitymoreinfo,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              goTo(context, const VirtualTour());
                            },
                            child: CachedNetworkImage(
                              imageUrl:
                                  universityResponseData.right.virtualTours[0],
                              errorWidget: (context, url, error) => Container(),
                              progressIndicatorBuilder:
                                  (context, url, progress) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Divider(
                              color: psGrey2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'University Overview',
                                style: PSTextStyle.universitymoreinfo,
                              ),
                            ),
                          ),
                          Text(
                            universityResponseData.right.overview,
                            style: PSTextStyle.universityinfo,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Divider(
                              color: psGrey2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'University Ranking',
                                style: PSTextStyle.universitymoreinfo,
                              ),
                            ),
                          ),
                          Text(
                            universityResponseData.right.ranking,
                            style: PSTextStyle.universityinfo,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Divider(
                              color: psGrey2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Average Tuition Cost per Year',
                                style: PSTextStyle.universitymoreinfo,
                              ),
                            ),
                          ),
                          Text(
                            universityResponseData.right.yearlyCost,
                            style: PSTextStyle.universityinfo,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Divider(
                              color: psGrey2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Our Programs',
                                style: PSTextStyle.universitymoreinfo,
                              ),
                            ),
                          ),
                           ExpandableContainer(
                              text: 'Bachelor Degree', content: Column()),
                          const SizedBox(
                            height: 10,
                          ),
                           ExpandableContainer(
                              text: 'Masters Degree', content: Column()),
                          const SizedBox(
                            height: 10,
                          ),
                           ExpandableContainer(
                              text: 'PHD Degree', content: Column()),
                          const SizedBox(
                            height: 10,
                          ),
                           ExpandableContainer(
                              text: 'Diploma', content: Column()),
                        ],
                      ),
// <<<<<<< university-profile
                    )
                  ],
                )
              : const Center(
                  child: Text('University has no profile yet'),
                ),
// =======
//                     )),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 1600,
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(10.0),
//                   child: Divider(
//                     color: psGrey1,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'Virtual Tour',
//                       style: PSTextStyle.universitymoreinfo,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       goTo(context, const VirtualTour());
//                     },
//                     child: Image.asset('assets/images/virtualtour.png')),
//                 const Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Divider(
//                     color: psGrey2,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'University Overview',
//                       style: PSTextStyle.universitymoreinfo,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   'The University of Alberta, also known as U of A or UAlberta, is a\npublic research university located in Edmonton, Alberta, Canada. It is\nwas founded in 1908 by Alexander Cameron Rutherford.',
//                   style: PSTextStyle.universityinfo,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Divider(
//                     color: psGrey2,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'University Ranking',
//                       style: PSTextStyle.universitymoreinfo,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   'The University of Alberta, also known as U of A or UAlberta, is a\npublic research university located in Edmonton, Alberta, Canada. It is\nwas founded in 1908 by Alexander Cameron Rutherford.',
//                   style: PSTextStyle.universityinfo,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Divider(
//                     color: psGrey2,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'Average Tuition Cost per Year',
//                       style: PSTextStyle.universitymoreinfo,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   'The University of Alberta, also known as U of A or UAlberta, is a\npublic research university located in Edmonton, Alberta, Canada. It is\nwas founded in 1908 by Alexander Cameron Rutherford.',
//                   style: PSTextStyle.universityinfo,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Divider(
//                     color: psGrey2,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'Our Programs',
//                       style: PSTextStyle.universitymoreinfo,
//                     ),
//                   ),
//                 ),
//                 ExpandableContainer(text: 'Bachelor Degree', content: Column()),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ExpandableContainer(text: 'Masters Degree', content: Column()),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ExpandableContainer(text: 'PHD Degree', content: Column()),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ExpandableContainer(text: 'Diploma', content: Column()),
//               ],
//             ),
//           )
//         ],
//       ),
// >>>>>>> dev
    );
  }
}
