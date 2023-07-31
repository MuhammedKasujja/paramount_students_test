import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:developer';
import 'dart:typed_data';
import 'package:hive_flutter/adapters.dart';
import 'package:either_dart/either.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/repository/chat/chat_repo.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/response/chat/chat.dart';
import 'package:paramount_students/data/response/notification/notification.dart';
import 'package:paramount_students/data/repository/notification/notifs_repo.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/ui/notification/model/notificaton_model.dart';

//retrieving reference to opened hive box
final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

final user = localDB.getUser();


class Store with ChangeNotifier {
  List<NotificationModel> _notifs = [];
  List<Map<String, dynamic>> _fileData = [];
  bool isLoading = false;
  bool gettingChats = false;
  bool gettingNotifications = false;
  int _numOfNotifs = 0;
  List<Chat> _contactData = [];
  bool _isTyping = false;
  LaravelFlutterPusher? _pusher;
  Channel? _channel;
  bool _initialNotifRequest = false;
  bool _initialChatRequest = false;
  List<Map<String, dynamic>> _savedChats = [];

  List<Map<String, dynamic>> get chats => [..._savedChats];

  List<Map<String, dynamic>> get fileData => [..._fileData];

  List<NotificationModel> get notifs => [..._notifs];

  LaravelFlutterPusher get pusherInstance => _pusher!;

  int get numOfNotifications => _numOfNotifs;

  bool get isTyping => _isTyping;

  List<Chat> get contactData => _contactData;

  Channel get channel => _channel!;

  void saveNotifsData(NotificationModel data)async{
    _notifs.add(data);
    _numOfNotifs++;
    notifyListeners();
  }

  void saveContactData(List<Chat> chats)async {
    _contactData = chats;
    notifyListeners();
  }

  void saveNewMessage(Map<String, dynamic> data){
    _savedChats.add(data);
    notifyListeners();
  }

   void saveFileData(Map<String, dynamic> data){
    _fileData.add(data);
    notifyListeners();
  }

  void checkChatStatus(){
    notifyListeners();
  }

  void clearFileData(){
    _fileData.clear();
    notifyListeners();
  }

  void saveTypingStatus(Map<String, dynamic> data){
    _isTyping = data['typing'];
    notifyListeners();
  }

  void markAsRead(Map<String, dynamic> data)async{
    await notifsViewedRequest(data);
    
  }

  void savePusherInstance(LaravelFlutterPusher pusher){
    _pusher = pusher;
    notifyListeners();
  }

  void saveUserChannel(Channel channel){
    _channel = channel;
    notifyListeners();
  }

  void decrementNotifsCounter(){
    _numOfNotifs--;
    notifyListeners();
  }

  void getChats(dynamic chatCode)async {
    final result = await getChatsRequest(chatCode);

    if(result.isRight){
      final list = result.right.map((chat) => {
        'message': chat.message,
        'picture_url': chat.userType == 'user' ? user.pictureUrl : chat.photoUrl,
        'created_at': chat.createdAt,
        "user_type": chat.userType,
        "time_at": chat.timeAt,
        "sender_id": chat.senderId,
        "receiver_id": chat.receiverId,
        "attachment": chat.attachment,
        "is_read": chat.isRead,
        "sender_type": chat.senderType,
        "receiver_type": chat.receiverType,
        "id": chat.id
      }).toList();

      if(!_initialChatRequest && _savedChats.isNotEmpty){
        _savedChats.addAll(list);
        _initialChatRequest = true;
        notifyListeners();
      }else{
        _savedChats = list;
        _initialChatRequest = true;
        notifyListeners();
      }
    }
  }

  Future<Either<bool, List<Chat>>> getChatsRequest(dynamic chatCode) async {
    isLoading = true;
    notifyListeners();

    final String token = localDB.getToken();
    log('This is the token gotten fro Hive = $token');

    final ChatRepo chatRepo = ChatRepo(token);

    log('Attempting to get chats');
    final conversations = await chatRepo.getChats(chatCode);

    if (conversations.isLeft) {
      log('getting chats failed: ${conversations.left.status}');

      handleError('chats failed to download');
      isLoading = false;
      notifyListeners();
      return Left(gettingChats);
    } else {
      log('getting chats successful');
      // toastMessage('chats downloaded', long: false);
      isLoading = false;
      notifyListeners();

      return Right(conversations.right.message!.left.chats!);
    }
    
  }


  void getNotifications(String id)async{
    final result = await getNotifsRequest(id);

    if(result.isRight){
      final list = result.right.map((notif) => NotificationModel(
        nHeadline: 'Message From ${notif.title}',
        nBody: Html(
          data: notif.description, 
          style: {
            '*': Style(
              margin: Margins.only(left: 0),
              fontSize: FontSize.small,
              maxLines: null
            )
          }),
        nTimeage: notif.createdAt!,
        id: notif.id!,
        ownerType: notif.ownerType![0] as String,
        viewed: notif.studentViewed,
        isRead: notif.studentViewed == "1"
      )).toList();

      if(_notifs.isEmpty){
        _notifs.addAll(list);
        _initialNotifRequest = true;
        notifyListeners();
      }
      
      if(!_initialNotifRequest){
        _notifs.addAll(list);
        _initialNotifRequest = true;
        notifyListeners();
      }
    
    }
  }

  Future<void> notifsViewedRequest(Map<String, dynamic> data) async {

    final String token = localDB.getToken();
    log('This is the token gotten fro Hive = $token');

    final NotifsRepo notifsRepo = NotifsRepo(token);

    log('Attempting to mark notification as read');
    final notifications = await notifsRepo.notifsViewed(data);

    if (notifications.isLeft) {
      log('Marking notification as read failed');

      handleError('couldn"t mark notification as read');

    } else {
      log('Marking notification as read successful');;
      // toastMessage('notification marked as read', long: false);

    }
    
  }

  Future<Either<bool, List<Notifs>>> getNotifsRequest(String userId) async {
    isLoading = true;
    notifyListeners();

    final String token = localDB.getToken();
    log('This is the token gotten fro Hive = $token');

    final NotifsRepo notifsRepo = NotifsRepo(token);

    log('Attempting to get notification list');
    final notifications = await notifsRepo.getNotifs(userId);

    if (notifications.isLeft) {
      log('getting notifications failed');

      handleError('notifications failed to download');
      isLoading = false;
      notifyListeners();
      return Left(gettingNotifications);
    } else {
      log('getting notification list successful');
      toastMessage('notification list downloaded', long: false);
      isLoading = false;
      notifyListeners();
      return Right(notifications.right.message!.left.data!);
    }
    
  }

 
  void handleError(dynamic data) {
    if (data is Map<String, dynamic>) {
      toastMessage(
        data['message'],
        long: true,
      );
    } else if (data is String) {
      toastMessage(
        data,
        long: true,
      );
    } else if (data is List) {
      for (var error in data) {
        toastMessage(
          error,
          long: true,
        );
      }
    } else {
      toastMessage(
        data.toString(),
        long: true,
      );
    }
  }


}
