import 'package:flutter/material.dart';
import 'package:paramount_students/ui/applications/view_model/applications_view_model.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'application_list_item.dart';

class ApplicationList extends StatelessWidget {
  final ProgramState courseType;
  const ApplicationList({super.key, required this.courseType});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationsViewModel>(
      builder: (context, model, child) => model.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: model.getPrograms(courseType).length,
              itemBuilder: (BuildContext context, int index) {
                return ApplicationProgramItem(
                  program: model.getPrograms(courseType)[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
    );
  }
}
