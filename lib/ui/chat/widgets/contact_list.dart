import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/base/base_view.dart';
import 'package:paramount_students/ui/chat/models/institution.dart';
import 'package:paramount_students/ui/chat/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

import '../views/profile_screen.dart';

final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);


class ContactList extends StatefulWidget {

  final Function setCounter;
  final int? instId;
  final String? instUserType;
  final dynamic chatCode;
  final String? instname;
  final dynamic chatClosed;
  final int? isRead;
  final String? instMsg;
  final DateTime? instCreatedAt;
  final String? instPhotoUrl;
  const ContactList({
    required this.setCounter, 
    this.instname, 
    this.instCreatedAt,
    this.instId,
    this.chatClosed, 
    this.chatCode,
    this.isRead,
    this.instPhotoUrl,
    this.instUserType,
    this.instMsg});


  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final Institution inst = Institution();
  // counter for number of selected items
  var count = 0;

  @override
  Widget build(BuildContext context) {
    final chatsStore = Provider.of<Store>(context, listen: false);

    final privateUserChatChannel = chatsStore.pusherInstance.subscribe('private-chat.${widget.chatCode}');

    chatsStore.saveUserChannel(privateUserChatChannel);  

    privateUserChatChannel.bind('new-message',(event) {
      chatsStore.saveNewMessage({...event, 'created_at': DateTime.parse(event['created_at'] ?? DateTime.now().toIso8601String())});
    });

    privateUserChatChannel.bind('client-typing',(event) {
      log('isTyping..');
      chatsStore.saveTypingStatus(event);
    });

    final instCreatedAt = widget.instCreatedAt ?? DateTime.now();
    final mins = DateTime.now().difference(instCreatedAt).inSeconds/60;
    final hrs = DateTime.now().difference(instCreatedAt).inSeconds/3600;
    final days = DateTime.now().difference(instCreatedAt).inSeconds/86400;
    final weeks = DateTime.now().difference(instCreatedAt).inSeconds/604800;

    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      decoration: BoxDecoration(
        color: inst.isSelected ? Color.fromARGB(26, 255, 193, 7) : widget.isRead == 1 ? Color.fromRGBO(224, 238, 248, .4) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ),
      padding: const EdgeInsets.only(
        right: 15,
        top: 10,
      ),
      child: Column(
        children: [
          Dismissible(
          key: ValueKey(widget.instId),
          secondaryBackground: Container(
            color: Theme.of(context).colorScheme.error,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(
              bottom: 5,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 25,
              ),
              child: sText(
                'Delete',
                color: Colors.white,
              ),
            ),
          ),
          background: Container(
            color: psSuccess,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              bottom: 5,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 25,
              ),
              child: sText(
                'Archive',
                color: Colors.white,
              ),
            ),
          ),
          onDismissed: (direction) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: appBlackText,
                content: sText(
                  '1 ${direction == DismissDirection.endToStart ? 'deleted' : 'archived'}',
                  color: Colors.white,

                ),
                duration: const Duration(
                  seconds: 2,
                ),
                action: SnackBarAction(
                  textColor: psInfo,
                  label: 'UNDO',
                  onPressed: () {},
                ),
              ),
            );
          },
          confirmDismiss: (direction) => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Are you sure?'),
              content: Text(
                  'Do you want to ${direction == DismissDirection.endToStart ? 'remove' : 'archive'} the message.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('No'),
                ),
              ],
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  goTo(context,  Profile(
                      chatCode: widget.chatCode,
                      instName: widget.instname, 
                      instId: widget.instId, 
                      instChat: widget.instMsg,
                      instUserType: widget.instUserType,
                      instPhotoUrl: widget.instPhotoUrl
                      ),
                  );
                },
                onLongPress: () {
                  setState(() {
                    inst.toggleSelected();                
                    if(inst.isSelected){
                      count = 1;
                      widget.setCounter(count, inst.isSelected);
                    }else{
                      count = -1;
                      widget.setCounter(count, inst.isSelected);
                    }
                  });
                },
                leading: Stack(
                  children: [
                    if (inst.isSelected)
                      const Icon(Icons.check_circle_rounded,
                          color: Colors.amber, size: 60,),
                    if (!inst.isSelected)
                    widget.instPhotoUrl == null
                    ? const CircleAvatar(
                      radius: 25,
                      backgroundColor: psGrey4,)
                    : CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(widget.instPhotoUrl!),
                    ),
                    if(!inst.isSelected && inst.isOnline)
                    Positioned(
                      top: 0,
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: psWhite,
                        ),
                        padding: EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                          ),
                          constraints: const BoxConstraints(
                            minHeight: 14,
                            minWidth: 14,
                          ),
                        )
                      ),
                    ),
                  ],
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sText(widget.instname ?? "instversity Of Waterloo", weight: widget.isRead == 1 ? FontWeight.normal : FontWeight.bold, size: isLandscape ? 15 : 14),
                    const Spacing.meduimHeight(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      child: sText(
                        widget.instMsg!.split('<')[0].isEmpty 
                        ? 'Application Progress Update! The instversity requires additional documents'
                        : widget.instMsg!.split('<')[0], 
                        size: 13, maxLines: null, color: psGrey3),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                    : '1year ago', size: isLandscape ? 13 : 11, weight: widget.isRead == 1 ? FontWeight.normal : FontWeight.bold),
                    const Spacing.meduimHeight(),
                    GestureDetector(
                      child: inst.isFavorite
                        ? const Icon(Icons.star,
                            color: Colors.amber,)
                        : const Icon(Icons.star_outline,
                            color: psGrey3),
                      onTap: (){
                        setState(() {
                            inst.toggleFavorites();
                        });
                      }),
                  ],
                ),
                ),
                // const Spacing.extraSmallHeight(),
                const Spacing.tinyHeight(),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 82,
                  ),
                  child: Divider(thickness: 1, color: psGrey4)),
              ],
            ),
          ),     

        ],
      ),
    );
  }
}