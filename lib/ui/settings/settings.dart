import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import 'widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: BackButton(color: Colors.black),
              expandedHeight: 120.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Settings',
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
            expandIcon: Icons.arrow_drop_up,
            collapseIcon: Icons.arrow_drop_down,
          ),
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: const [
              DateTimeCard(),
              PushNotificationCard(),
              AboutUsCard(),
              TermsConditionsCard(),
              PolicyCard()
            ],
          ),
        ),
      ),
    );
  }
}
