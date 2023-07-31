import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/widgets/buttons/app_elevated_button.dart';
import 'package:paramount_students/ui/applications/models/models.dart';

import 'views/views.dart';

class ViewApplicationProgram extends StatelessWidget {
  final Program program;
  const ViewApplicationProgram({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              elevation: 8,
              backgroundColor: Colors.white,
              leading: BackButton(color: Colors.black),
              expandedHeight: 120.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Apply',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ];
        },
        body: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.black,
            useInkWell: true,
            expandIcon: Icons.arrow_right,
            collapseIcon: Icons.arrow_drop_down,
            iconSize: 32,
          ),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const ProfileCard(),
              const ContactsCard(),
              const EducationCard(),
              const DocumentsCard(),
              DecisionLetterCard(
                letters: program.letters,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AppElevatedButton(
                  textColor: Colors.black,
                  label: 'Proceed',
                  isLoading: false,
                  borderColor: appYellowText,
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
