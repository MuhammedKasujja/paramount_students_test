import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/models/store.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

//retrieving reference to opened hive box
final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

final user = localDB.getUser();

class Day extends StatelessWidget {
  final List dayList;
  final String? userName;
  final String? contactName;
  const Day(this.dayList,{this.contactName, this.userName});

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;      
    return Column(
      children: dayList.map((day) => Column(
        children: [
          ListTile(
            leading: day['user_type'] == 'user'
              ? CircleAvatar(
                radius: 20,
                backgroundImage:  NetworkImage(user.pictureUrl),)
              : CircleAvatar(
                radius: 20,
                backgroundColor: psGrey4,
              ),
            title: Padding(
              padding: EdgeInsets.only(top: 
              day['message'].contains('<')
              ? 13 
              : 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      sText(day['user_type'] == 'user'
                      ? userName
                      : contactName, 
                        weight: FontWeight.bold, 
                        color: appBlackText,  
                        size: 14),
                      const Spacing.smallWidth(),
                      sText(
                      day['time_at'],  
                      color: psGrey2,  
                      size: 12),
                    ],
                  ),
                  const Spacing.tinyHeight(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Html(
                      data: day['message'],
                      onLinkTap: _onLinkTap, 
                      style: {
                        '*': Style(
                          margin: Margins.only(left: 0),
                          maxLines: null,
                        )
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacing.tinyHeight()
        ],
      )).toList(),
    );
  }

  void _onLinkTap(String? url, _, element)async{
    try{
      if (await canLaunchUrl(Uri.parse(url!))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }catch(err){
      toastMessage(err.toString(), long: true);
    }
    
}
}