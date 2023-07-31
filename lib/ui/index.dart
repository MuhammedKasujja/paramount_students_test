import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/chat/widgets/chat_notification_badge.dart';
import 'package:paramount_students/ui/home/home.dart';
import 'package:paramount_students/ui/notification/view/notification.dart';
import 'package:paramount_students/ui/notification/widget/notification_badge.dart';
import 'package:paramount_students/ui/search/view/search.dart';
import 'package:paramount_students/ui/shortlist/view/shortlist.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var tabLabelColor = psGrey4;
  var numOfNotifications = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(updateTabLabelColor);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController.removeListener(updateTabLabelColor);
    super.dispose();
  }

  void updateTabLabelColor() {
    Future.delayed(const Duration(milliseconds: 50)).then((_) {
      setState(() {
        if (_tabController.index != 3) {
          if (numOfNotifications > 0) {
            return;
          }
          tabLabelColor = psGrey4;
        } else {
          tabLabelColor = appYellowText;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final channelsStore = Provider.of<Store>(context);
    numOfNotifications = channelsStore.numOfNotifications;
    return Scaffold(
      bottomNavigationBar: Container(
        color: appBlackText,
        child: TabBar(
          controller: _tabController,
          isScrollable: false,
          labelColor: appYellowText,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          // indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.transparent,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          tabs: [
            const Tab(
              text: 'Home',
              icon: Icon(Icons.home),
              iconMargin: EdgeInsets.only(bottom: 5),
            ),
            const Tab(
              text: 'Search',
              icon: Icon(Icons.search),
              iconMargin: EdgeInsets.only(bottom: 5),
            ),
            const Tab(
              text: 'Shortlist',
              icon: Icon(Icons.bookmark),
              iconMargin: EdgeInsets.only(bottom: 5),
            ),
            Tab(
              icon: channelsStore.numOfNotifications > 0
                  ? NotificationBadge(counter: channelsStore.numOfNotifications)
                  : const Icon(Icons.notification_important),
              child: sText('Notifications', color: tabLabelColor, size: 14),
              iconMargin: const EdgeInsets.only(bottom: 5),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomePage(),
          SearchPage(),
          ShortlistPage(),
          NotificationPage(),
        ],
      ),
    );
  }
}
