import "dart:developer";

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/ui/custom/menu_drawer.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/models/store.dart';

import '../widget/action_bar.dart';

final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Store>(context, listen: false).getNotifications(localDB.getUser().id.toString());

  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final channels = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: sText(PSStrings.psNotification,
            weight: FontWeight.bold, color: appBlackText, size: 18),
        iconTheme: const IconThemeData(color: appBlackText),
      ),
      drawer: const MenuDrawer(),
      body: channels.isLoading
      ? Center(child: CircularProgressIndicator())
      :Consumer<Store>(
        builder: (_, channels, ch) => Column(
          children: [
            if(channels.notifs.isNotEmpty)
            ActionBar(),
            Expanded(
              child: channels.notifs.isEmpty
              ? Center(
                    child: sText(
                        "No recent notifications.\nYou'll be informed of new notifications",
                        weight: FontWeight.bold,
                        size : 14,
                        color: Colors.black,
                        align: TextAlign.center
                      ),
                  )
              :ListView.builder(
                shrinkWrap: true,
                itemCount: channels.notifs.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, i) {
                  final notifCreatedAt = channels.notifs[i].nTimeage;
                  final mins = DateTime.now().difference(notifCreatedAt!).inSeconds/60;
                  final hrs = DateTime.now().difference(notifCreatedAt).inSeconds/3600;
                  final days = DateTime.now().difference(notifCreatedAt).inSeconds/86400;
                  final weeks = DateTime.now().difference(notifCreatedAt).inSeconds/604800;
              
                  return GestureDetector(
                    onTap: (){
                      channels.notifs[i].markAsRead({
                          "notification_id": channels.notifs[i].id,
                          "owner_type": channels.notifs[i].ownerType
                      });
                      setState(() {
                        channels.decrementNotifsCounter();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: channels.notifs[i].isRead ? appBlackText : Colors.amber,
                                    shape: BoxShape.circle,
                                    boxShadow: appShadow(Colors.grey, 1, 1, 1),
                                  ),
                                                    ),
                              ),
                              Expanded(
                                flex: 24,
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          sText(
                                            channels.notifs[i].nHeadline,
                                            size: 13,
                                            weight: FontWeight.bold,
                                          ),
                                          sText(mins < 1 
                                            ? 'secs ago'
                                            : (mins >= 1 && mins < 60)
                                            ? '${mins.floor()}min(s) ago'
                                            : (hrs >= 1 && hrs < 24)
                                            ? '${hrs.floor()}Hour(s) ago' 
                                            : (hrs >= 24 && hrs < 48)
                                            ? 'Yesterday'
                                            : (hrs >= 48 && hrs < 168)
                                            ? '${(hrs/24).floor()}day(s) ago'
                                            : (days >= 7 && days < 28) 
                                            ? '${(days/7).floor()}week(s) ago'
                                            : (weeks >= 4 && weeks < 52)
                                            ? '${(weeks/4).floor()}month(s) ago'
                                            : '1year ago', size: isLandscape ? 13 : 11
                                          ),
                                        ],
                                      ),
                                      const Spacing.smallHeight(),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * .6,
                                        child: channels.notifs[i].nBody
                                        ),
                                    ],
                                  ),
                                  // trailing: InkWell(
                                  //   onTap: () {
                                  //     actionsModalBottomSheet(context);
                                  //   },
                                  //   child: const Icon(Icons.more_vert),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Divider(
                              thickness: 0.5,
                              color: channels.notifs[i].isRead ? appBlackText : Colors.amber,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
