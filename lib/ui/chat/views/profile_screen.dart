import 'dart:developer';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/chat/service/modals.dart';
import 'package:paramount_students/ui/chat/view_model/chat_view_model.dart';
import 'package:paramount_students/data/response/chat/chat.dart';
import 'package:paramount_students/core/constants.dart';
import 'package:provider/provider.dart';

import '../widgets/title_bar.dart';
import '../widgets/messages.dart';
import '../widgets/action_bar.dart';
import '../widgets/new_message.dart';
import '../enum_constants.dart';
import '../reorder_list.dart';
import '../../../data/repository/services/PusherWebSockets/pusher.dart';

//retrieving reference to opened hive box
final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

final userMap = localDB.getUser().toMap();

class Profile extends StatefulWidget {
  final String? instName;
  final dynamic chatCode;
  final String? instUserType;
  final int? instId;
  final String? instChat;
  final String? instPhotoUrl;
  Profile({this.instName, this.instId, this.instChat, this.instUserType, this.instPhotoUrl, this.chatCode});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserActions? currentAction;
  final _focusNode = FocusNode();
  List<dynamic> eventData = [];
  final Modals modals = Modals();
  Timer? timer1;
  Timer? timer2;

  late bool isMe;
  String? userId;

  void setAction(UserActions action) {
    setState(() {
      currentAction = action;
    });
  }

  void cancelAction(UserActions? action) {
    setState(() {
      currentAction = action;
    });
  }
  
  void _setTextFieldFocus(){
    setState(() {
      _focusNode.unfocus();
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer1!.cancel();
    timer2!.cancel();
    _focusNode.dispose();
    //clearing files from persistent storage
    localDB.deleteEntry(HiveKeys.file0);
    localDB.deleteEntry(HiveKeys.file1);
    localDB.deleteEntry(HiveKeys.file2);
    localDB.deleteEntry(HiveKeys.file3);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //confirming current loggedin user
    isMe = userMap['id'] != widget.instId ||
        userMap['user_type'] != widget.instUserType;

    Provider.of<Store>(context, listen: false).getChats(widget.chatCode);

  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape; 
    final chatsStore = Provider.of<Store>(context);
    //extracting chats for different months
    final monthList = Order.reorderList(chatsStore.chats);
    //checking if chat session has ended
    // if(monthList[0]['chat_closed'].toString() == '1'){
    //   Navigator.of(context).pop();
    // }

    timer1 = Timer(const Duration(seconds: 5), () {
      chatsStore.saveTypingStatus({"typing": false});
      timer1!.cancel();
    });

    timer2 = Timer.periodic(const Duration(seconds: 60), (timer){
      chatsStore.checkChatStatus();
    });

    return WillPopScope(
      onWillPop: () async {
        //clearing file data from store to free up resources
        Provider.of<Store>(context, listen: false).clearFileData();

        // Return true to allow the back button press, or false to prevent it.
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: isLandscape ? false : true,
        body: chatsStore.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (MediaQuery.of(context).viewInsets.bottom == 0  || isPortrait)
                TitleBar(currentAction, cancelAction, chatsStore.isTyping, widget.instName, () => modals.openTextFieldModal(
                  context: context,
                  isMe: isMe,
                  chatCode: widget.chatCode,
                  studentFullName: userMap['full_name'],
                  studentId: userMap['id'],
                  studentPhotoUrl: userMap['picture_url'],
                  instId: widget.instId,
                  instName: widget.instName,
                  instUserType: widget.instUserType,
                  instPhotoUrl: widget.instPhotoUrl,
                  focusNode:_focusNode
          
                )),
                if(currentAction == null && (MediaQuery.of(context).viewInsets.bottom == 0  || isPortrait))
                const Divider(thickness: 1, color: psGrey3,),
                if (MediaQuery.of(context).viewInsets.bottom == 0  || isPortrait)
                Expanded(
                  child: chatsStore.chats.isEmpty
                    ? GestureDetector(
                      onTap: _setTextFieldFocus,
                      child: Center(
                        child: sText(
                            'No recent chats.\nBegin a new conversation with your contact',
                            weight: FontWeight.bold,
                            size : 14,
                            color: Colors.black,
                            align: TextAlign.center
                          ),
                      ),
                    )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap: _setTextFieldFocus,
                            child: Messages(
                              chatsPerMonth: monthList[i],
                              userName: userMap['full_name'],
                              contactName: widget.instName,
                            ),
                          );
                          
                        },
                        itemCount: monthList.length,
                      ),
                ),
                if(isPortrait)
                NewMessage(
                  userType: widget.instUserType, 
                  chatCode: widget.chatCode,
                  receiverId: widget.instId, 
                  senderName: userMap['full_name'],
                  senderPictureUrl: userMap['picture_url'],
                  isMe: isMe,
                  senderId: userMap['id'],
                  newMsgFocusNode: _focusNode),
              ],
            ),
          floatingActionButton: Platform.isIOS & isLandscape
            ? Container()
            : !Platform.isIOS &&isLandscape
            ? FloatingActionButton(
                onPressed: ()async{
                  await modals.openTextFieldModal(
                    context: context,
                    isMe: isMe,
                    chatCode: widget.chatCode,
                    studentFullName: userMap['full_name'],
                    studentId: userMap['id'],
                    studentPhotoUrl: userMap['picture_url'],
                    instId: widget.instId,
                    instName: widget.instName,
                    instUserType: widget.instUserType,
                    instPhotoUrl: widget.instPhotoUrl,
                    focusNode:_focusNode
                  );
                },
                child: const Icon(Icons.add),
              )
            : null,
      
      ),
    );
  }
}
