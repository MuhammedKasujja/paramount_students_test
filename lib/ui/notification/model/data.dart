import 'package:flutter/material.dart';
import 'package:paramount_students/ui/notification/model/bottom_sheet_model.dart';
import 'package:paramount_students/ui/notification/model/notificaton_model.dart';

///Dummy data to be removed as the app begins to interact with API
List<BottomSheetModel> bottomSheetData = [
  BottomSheetModel(
    title: 'Delete',
    subtitle: 'Delete this notification',
    icon: Icons.delete,
  ),
  BottomSheetModel(
    title: 'Mute',
    subtitle: 'Stop seeing this notification',
    icon: Icons.notifications_off,
  ),
  BottomSheetModel(
    title: 'Turn off',
    subtitle: 'Stop receiving notification like this',
    icon: Icons.cancel,
  ),
];

List<NotificationModel> notificationData = [
  // NotificationModel(
  //   nHeadline: 'Message from University of Ghana',
  //   nBody:
  //       'Congratulations, we have reviewed your application to our esteemed university and we would keep you updated on our decision.',
  //   nTimeage: '30mins ago',
  // ),
  // NotificationModel(
  //   nHeadline: 'Message from University of Benin',
  //   nBody:
  //       'Congratulations, we you have been accepted to our esteemed university. Congratulations, we you have been accepted to our esteemed university',
  //   nTimeage: '20mins ago',
  // ),
  // NotificationModel(
  //   nHeadline: 'Message from FUTO',
  //   nBody:
  //       'Sorry, Your application has been declined. But we will keep your details with us for future purpose.Sorry, Your application has been declined. But we will keep your details with us for future purpose ',
  //   nTimeage: '5mins ago',
  // ),
  // NotificationModel(
  //   nHeadline: 'Message from University of Ghana',
  //   nBody:
  //       'Congratulations, we have reviewed your application to our esteemed university and we would keep you updated on our decision.',
  //   nTimeage: '30mins ago',
  // ),
  // NotificationModel(
  //   nHeadline: 'Message from University of Benin',
  //   nBody:
  //       'Congratulations, we you have been accepted to our esteemed university. Congratulations, we you have been accepted to our esteemed university',
  //   nTimeage: '20mins ago',
  // ),
  // NotificationModel(
  //   nHeadline: 'Message from FUTO',
  //   nBody:
  //       'Sorry, Your application has been declined. But we will keep your details with us for future purpose.Sorry, Your application has been declined. But we will keep your details with us for future purpose ',
  //   nTimeage: '5mins ago',
  // ),
  // NotificationModel(
  //   nHeadline: 'Message from University of Ghana',
  //   nBody:
  //       'Congratulations, we have reviewed your application to our esteemed university and we would keep you updated on our decision.',
  //   nTimeage: '30mins ago',
  // ),
  // NotificationModel(
  //   nHeadline: 'Message from University of Benin',
  //   nBody:
  //       'Congratulations, we you have been accepted to our esteemed university. Congratulations, we you have been accepted to our esteemed university',
  //   nTimeage: '20mins ago',
  // ),
  // NotificationModel(
  //   nHeadline: 'Message from FUTO',
  //   nBody:
  //       'Sorry, Your application has been declined. But we will keep your details with us for future purpose.Sorry, Your application has been declined. But we will keep your details with us for future purpose ',
  //   nTimeage: '5mins ago',
  // ),
];
