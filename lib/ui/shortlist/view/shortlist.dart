import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/ps_app_bar.dart';
import 'package:paramount_students/ui/custom/menu_drawer.dart';
import 'package:paramount_students/ui/shortlist/view_model/short_list_view_model.dart';
import 'package:paramount_students/ui/shortlist/widgets/short_list_card.dart';
import 'package:provider/provider.dart';

class ShortlistPage extends StatelessWidget {
  const ShortlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      body: Column(
        children: [
          const PSAppBar(
            title: PSStrings.psShortList,
          ),
          Expanded(
            child: Consumer<ShortListViewModel>(
              builder: (context, model, child) => ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: model.shortlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return ShortListCard(
                    shortListModel: model.shortlist[index],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
