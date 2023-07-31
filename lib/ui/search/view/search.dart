import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/ps_app_bar.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/course_program/views/course_program.dart';
import 'package:paramount_students/ui/custom/menu_drawer.dart';
import 'package:paramount_students/ui/home/view_model/home_view_model.dart';
import 'package:paramount_students/ui/programs/program_tile.dart';
import 'package:paramount_students/ui/search/widgets/recently_searched.dart';

import '../widgets/search_bar.dart';

final model = HomeViewModel();

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController searchController;
  List<Program>? mainList = model.allPrograms!.data?.responseBody!.data!;
  bool _isSearching = false;

  List<Program> _searchedProgram = [];

  void _searchListener() {
    if (searchController.text.trim().isNotEmpty) {
      String searchQuery = searchController.text.trim().toLowerCase();

      List<Program> tempList = [];

      for (int i = 0; i < mainList!.length; i++) {
        final singleItem = mainList![i];

        if (singleItem.name.toLowerCase().contains(searchQuery)) {
          tempList.add(singleItem);
        }
      }
      setState(() {
        _searchedProgram = tempList;
        _isSearching = true;
      });
    } else {
      setState(() {
        _isSearching = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    searchController.addListener(_searchListener);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void navigateToCourseProgram(Program programs) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseProgram(
          program: programs,
        ),
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      body: Column(
        children: [
          const PSAppBar(
            title: PSStrings.psSearch,
          ),
          SearchBarWidget(controller: searchController),
          const ReceentlySearched(),
          _isSearching
              ? SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: _searchedProgram.length,
                    itemBuilder: (BuildContext context, int index) {
                      final programs = _searchedProgram[index];
                      return ProgramTile(
                        icon: programs.university.coverPhotoUrl,
                        program: programs,
                        department: programs.faculty,
                        onPressed: () {
                          navigateToCourseProgram(programs);
                        },
                      );
                    },
                  ),
                )
              :

              // SizedBox(
              //   height: 200,
              //   child: ListView.builder(
              //       itemCount: mainList!.length,
              //       itemBuilder: (BuildContext context, int index) {
              //         final programs = mainList![index];
              //         return ProgramTile(
              //           onPressed: () {
              //             navigateToCourseProgram(programs);
              //           },
              //           id: programs.id.toString(),
              //           image: programs.coverPhotoUrl,
              //           icon: programs.university!.coverPhotoUrl,
              //           university: programs.university!.name,
              //           address: programs.university!.address,
              //           isActive: programs.isActive,
              //           learningMode: programs.learningMode![0],
              //           program: programs.programName,
              //           duration: programs.programDuration,
              //           discount: programs.tuitionFees!.first.scholarshipPercent,
              //           fees: programs.tuitionFees!.first.amount,
              //           department: programs.faculty,
              //           originalFees:
              //               programs.tuitionFees!.first.amount.toString(),
              //         );
              //       },
              //     ),
              // ),
              Center(child: Text('No Searched Data')),
          // const RecentlySearchedList(),

          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: AppDimension.medium,
          //   ),
          //   child: PsCardButton(
          //     buttonColor: HexColor("#191C1C"),
          //     onPressed: () {},
          //     textColor: Colors.white,
          //     buttonText: PSStrings.psSearch,
          //   ),
          // ),
          const Spacing.meduimHeight(),
        ],
      ),
    );
  }
}
