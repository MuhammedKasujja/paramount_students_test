import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/base/base_view.dart';
import 'package:paramount_students/ui/chat/view_model/chat_view_model.dart';
import 'package:paramount_students/ui/custom/menu_drawer.dart';
import 'package:paramount_students/data/response/chat/chat.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/ui/notification/view/notification.dart';
import 'package:provider/provider.dart';


import '../widgets/search_bar.dart';
import '../widgets/chat_notification_badge.dart';
import '../widgets/contact_list.dart';

//retrieving reference to opened hive box
final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

final userMap = localDB.getUser().toMap();


class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final TextEditingController searchController = TextEditingController();
  var searchQuery = '';
  final ChatViewModel model = ChatViewModel();
  late Timer timer;
  var numOfSelectedItems = 0;
  List<Chat> updatedChats = [];
  List<Chat> searchResults = [];
  List<Chat> chats = [];

  String? status;

  void _setFilter(String? filter) {
    setState(() {
      status = filter;
    });
  }

  void _setSearchQuery(String query){
    setState(() {
      searchQuery = query;
    });
  }

  void counter(int count, bool isSelected){
    setState((){
      isSelected = isSelected;
      numOfSelectedItems += count;
      searchController.text = numOfSelectedItems == 0 ? '' : numOfSelectedItems.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    //initializing timer to update creation time of chat
    timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      setState(() {});
    });

    model.getContactsRequest().then((result){
      if(result.isRight){
        chats.addAll(result.right);
        Provider.of<Store>(context, listen: false).saveContactData(chats);
      }
      setState((){});
    });
  }

  @override
  void dispose() {
    // TODO: mplement dispose
    super.dispose();
    searchController.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final chatsStore = Provider.of<Store>(context);
    
    switch (status) {
      case 'Unread Messages':
        updatedChats = chatsStore.contactData
        .where((chat) => chat.isRead == 0)
        .where((chat) => chat.name!.contains(searchQuery) || chat.message!.contains(searchQuery)).toList();
        break;
      case 'Read Messages':
        updatedChats = chatsStore.contactData
        .where((chat) => chat.isRead == 1)
        .where((chat) => chat.name!.contains(searchQuery) || chat.message!.contains(searchQuery)).toList();
        break;
      // case 'Favourite Messages':
      //   updatedChats.addAll(chats.where((chat) => chat.isFavourite == 1).toList());
      //   break;
      case 'All Messages':
        updatedChats = chatsStore.contactData
        .where((chat) => chat.name!.contains(searchQuery) || chat.message!.contains(searchQuery)).toList();
        break;
      default:
        updatedChats = chatsStore.contactData
        .where((chat) => chat.name!.contains(searchQuery) || chat.message!.contains(searchQuery)).toList();
        break;
    }
  
    final appBar = AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: appBlackText),
        // leading: GestureDetector(
        //   onTap: () => Navigator.pop(context),
        //   child: const Icon(
        //     Icons.arrow_back,
        //     color: appBlackText,
        //   ),
        // ),
        title: sText(
          'Chat',
          color: appBlackText,
          size: 20,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: ChatNotificationBadge(counter: chatsStore.numOfNotifications),
              onTap: () => goTo(context, const NotificationPage(), replace: true)),
          )
        ],
        
      );
    return Scaffold(
      appBar: MediaQuery.of(context).viewInsets.bottom == 0 || isPortrait ? appBar : null,
      drawer: const MenuDrawer(),
      body: model.isLoading 
      ? const Center(child: CircularProgressIndicator())
      : Column(
        children: [
          Search(
            controller: searchController, 
            setFilter: _setFilter,
            numOfSelectedItems: numOfSelectedItems,
            setSearchQuery: _setSearchQuery),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) {
                return ContactList(
                  setCounter: counter,
                  instId: updatedChats[i].receiverId,
                  instname: updatedChats[i].name,
                  isRead: updatedChats[i].isRead,
                  instMsg:  updatedChats[i].message,
                  instUserType: updatedChats[i].userType,
                  instCreatedAt: updatedChats[i].createdAt,
                  instPhotoUrl: updatedChats[i].photoUrl,
                  chatCode: updatedChats[i].chatCode,
                  chatClosed: updatedChats[i].chatClosed
                );
              },
              itemCount: updatedChats.length,
            )
          ),
        ],
      ),
    );
  }
}
