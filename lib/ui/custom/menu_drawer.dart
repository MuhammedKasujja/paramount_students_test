import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/applications/applications.dart';
import 'package:paramount_students/ui/documents/views/documents.dart';
import 'package:paramount_students/ui/profile/view/profile.dart';
import 'package:paramount_students/ui/profile/view_model/profile_view_model.dart';
import 'package:paramount_students/ui/chat/views/contacts_screen.dart';

import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/settings/settings.dart';
// import 'package:paramount_students/ui/documents/documents.dart';
// import 'package:paramount_students/ui/profile/view/profile.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final Radius drawerCurveRadius = const Radius.circular(30.0);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = ProfileViewModel();
    //todo: Remove this getUser() function
    model.getUser();
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: drawerCurveRadius,
          bottomRight: drawerCurveRadius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.25,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.247,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/png/drawer/paramountStudentsBg.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    // color: Colors.blue,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image.asset(
                        'assets/images/png/drawer/paramountStudentsTxt.png',
                        height: 150.0,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.amber,
                  height: size.height * 0.003,
                  thickness: size.height * 0.003,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  drawerListItem(
                    context: context,
                    iconData: Icons.library_books_rounded,
                    target: () {
                      goTo(context, const DocumentsPage());
                    },
                    title: 'Documents',
                  ),
                  drawerListItem(
                    context: context,
                    iconData: Icons.app_registration_sharp,
                    target: () {
                      // Navigator.of(context).pop();
                      goTo(context, const ApplicationsPage());
                    },
                    title: 'Applications',
                  ),
                  drawerListItem(
                    context: context,
                    iconData: Icons.messenger_rounded,
                    target: () => goTo(context, const Contacts(), replace: true),
                    title: 'Chats',
                  ),
                  drawerListItem(
                    context: context,
                    iconData: Icons.help,
                    target: () {},
                    title: 'Help and Support',
                  ),
                  drawerListItem(
                    context: context,
                    iconData: Icons.settings,
                    target: () => goTo(context, const SettingsPage()),
                    title: 'Settings',
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => goTo(context, const ProfilePage()),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 10.0,
                top: 40.0,
              ),
              child: Expanded(
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                            image: model.userData.document!.formalPhoto == null
                                ? const DecorationImage(
                                    image: AssetImage(
                                      "assets/images/home_page_banner1.png",
                                    ),
                                  )
                                : DecorationImage(
                                    image: NetworkImage(
                                      model.userData.document!.formalPhoto!,
                                    ),
                                  ),
                          ),
                          // child:
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.userData.fullName ?? 'Paramount',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                model.userData.email ?? 'help@paramount.com',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerListItem({
    required BuildContext context,
    required String title,
    required IconData iconData,
    required VoidCallback target,
  }) {
    return GestureDetector(
      onTap: target,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          bottom: 10.0,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.black,
              size: 26.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
