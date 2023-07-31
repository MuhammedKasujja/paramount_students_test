import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/ui/base/base_view.dart';

import 'models/unversity_course.dart';
import 'view_model/applications_view_model.dart';
import 'widgets/appplication_list.dart';

class ApplicationsPage extends StatefulWidget {
  const ApplicationsPage({super.key});

  @override
  State<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: const BackButton(),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            tabs: const [
              Tab(text: PSStrings.psApplicationsPending),
              Tab(text: PSStrings.psApplicationsSubmitted),
              Tab(text: PSStrings.psApplicationsApproved),
              Tab(text: PSStrings.psApplicationsRejected),
            ],
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            padding: const EdgeInsets.only(bottom: 10),
            isScrollable: false,
          ),
          title: const Text(
            PSStrings.psApplications,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: BaseView<ApplicationsViewModel>(
          model: ApplicationsViewModel(),
          onModelReady: (model) {
            model.init();
            model.fetchAppliedPrograms();
          },
          onDispose: (model) => model.dispose(),
          builder: (context, model, child) => const TabBarView(
            children: [
              ApplicationList(courseType: ProgramState.pending),
              ApplicationList(courseType: ProgramState.submitted),
              ApplicationList(courseType: ProgramState.approved),
              ApplicationList(courseType: ProgramState.rejected),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
