
import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:file_picker/file_picker.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/response/chat/chat.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/requests/chat/chat_form.dart';
import 'package:paramount_students/data/repository/chat/chat_repo.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/models/store.dart';

import 'package:paramount_students/ui/base/base_view_model.dart';
import 'package:paramount_students/models/file.dart';
import 'package:paramount_students/models/file_operation.dart';

final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);


class ChatViewModel extends BaseViewModel {
  DocumentUploadFormModel? documentUploadFormModel;
  TextEditingController textController = TextEditingController(text: '');
  dynamic docRequest;
  Timer? timer;
  ChatRepo? chatRepo;
  String attachmentUrls = '';
  String span = '';

  @override
  void close() {
    // TODO: implement close
    fileNameCont.dispose();
    textController.dispose();
      
  }

  @override
  void init() {
    // TODO: implement init
  }


  List<Map<String, dynamic>> documentList = [];

    //Document upload
  FilePickerResult? fileUpload0;

  String? fileName;

  Uint8List? fileByte;

  double? fileSize;

  bool isLoading = false;
  bool gettingContacts = false;
  bool sendingChat = false;

  //fileName Controller
  TextEditingController fileNameCont = TextEditingController();

  double get progressValue => _progressValue;

  double _progressValue = 0.0;

  void deleteUploadedDocument(){
    fileUpload0 = null;
    //clearing selected file from box
    localDB.deleteEntry(HiveKeys.file0);
    localDB.deleteEntry(HiveKeys.file1);
    localDB.deleteEntry(HiveKeys.file2);
    localDB.deleteEntry(HiveKeys.file3);
    notifyListeners();
  }

  void updateTextField(){
    attachmentUrls = '';
    for(var i = 0; i < documentList.length; i++){
      switch (documentList[i].keys.toList()[0].split('.')[1]) {
        case 'jpg':
          span = '''<span>
          <a style="text-decoration: none;" target="_blank" rel="noopener noreferrer" href="${documentList[i].values.toList()[0]}">
          <img src="${documentList[i].values.toList()[0]}" alt="Image" style="width: 70px; height:70px"/>
          </a>
          </span>''';
          attachmentUrls = '$attachmentUrls$span';
          break;
        case 'jpeg':
          span = '''<span>
          <a style="text-decoration: none;" target="_blank" rel="noopener noreferrer" href="${documentList[i].values.toList()[0]}">
          <img src="${documentList[i].values.toList()[0]}" alt="Image" style="width: 70px; height:70px"/>
          </a>
          </span>''';
          attachmentUrls = '$attachmentUrls$span';
          break;
        case 'png':
          span = '''<span>
          <a style="text-decoration: none;" target="_blank" rel="noopener noreferrer" href="${documentList[i].values.toList()[0]}">
          <img src="${documentList[i].values.toList()[0]}" alt="Image" style="width: 70px; height:70px"/>
          </a>
          </span>''';
          attachmentUrls = '$attachmentUrls$span';
          break;
        case 'gif':
          span = '''<span>
          <a style="text-decoration: none;" target="_blank" rel="noopener noreferrer" href="${documentList[i].values.toList()[0]}">
          <img src="${documentList[i].values.toList()[0]}" alt="Image" style="width: 70px; height:70px"/>
          </a>
          </span>''';
          attachmentUrls = '$attachmentUrls$span';
          break;
        case 'svg':
          span = '''<span>
          <a style="text-decoration: none;" target="_blank" rel="noopener noreferrer" href="${documentList[i].values.toList()[0]}">
          <img src="${documentList[i].values.toList()[0]}" alt="Image" style="width: 70px; height:70px"/>
          </a>
          </span>''';
          attachmentUrls = '$attachmentUrls$span';
          break;
        default:
          span = '<span>&#128196;<a style="text-decoration: none;" href="${documentList[i].values.toList()[0]}">${documentList[i].keys.toList()[0]}</a></span>';
          attachmentUrls = '$attachmentUrls$span';
          break;
      }
      
    }
    notifyListeners();
  }

  // void updateProgress() {
  //   timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
  //       _progressValue += 0.1;
  //       notifyListeners();
  //       if (_progressValue >= 1.0) {
  //         _progressValue = 0.0;
  //       }
  //    });
    
  // }

  Future<void> pickFile0(BuildContext context, String val, NavigatorState navigator, 
  {TextEditingController? controller, bool isAddingExtra = false, Store? store}) async {
    fileUpload0 = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
    );

    if (fileUpload0 != null) {
      fileSize = (fileUpload0!.files.first.size/1024)/1024;
      if(fileSize! > 5.0){
        log('file has exceeded file size limit');
        toastMessage("File has exceeded 5MB", long: true);
        return;
      }
      log('File name is ${fileUpload0!.files.first.name}');
      //checking if user wants to add more than one document
      if(isAddingExtra == true){
        final String token = localDB.getToken();
        log('This is the token gotten fro Hive = $token');

        chatRepo = ChatRepo(token);

        final FileOperation fileOperation = FileOperation(
            fileUpload0: fileUpload0,
            userFileName: fileUpload0!.files.first.name,
            store: store,
            chatRepo: chatRepo, 
            deleteUploadedDocument: deleteUploadedDocument, 
            handleError: handleError, 
            isChat: true);
          
        fileOperation.savingFiles();

        final result = await fileOperation.sortingFilesForRequest();

        documentList = result;
        notifyListeners();

        log('documentListReturned: $documentList');
        updateTextField();
        return;
      }
      
      if(localDB.boxLength() < 3){
        localDB.saveFile(PickedFile(
        filePath0: fileUpload0!.files.first.path!, 
        userFileName0: fileUpload0!.files.first.name,
        fileName0: fileUpload0!.files.first.name,
        fileSize0: fileUpload0!.files.first.size), 0);

        final String token = localDB.getToken();
        log('This is the token gotten fro Hive = $token');

        chatRepo = ChatRepo(token);

          final FileOperation fileOperation = FileOperation(
          chatRepo: chatRepo, 
          deleteUploadedDocument: deleteUploadedDocument, 
          store: store,
          handleError: handleError, 
          isChat: true);
        
        final result = await fileOperation.sortingFilesForRequest();

        documentList = result;
        notifyListeners();
        log('documentListReturned: $documentList');
      
        updateTextField();  
        return;   
      }
      

    }
  }


  Future<bool> sendChatRequest(Map<String,dynamic> chatFormData) async {
    isLoading = true;
    notifyListeners();

    final String token = localDB.getToken();
    log('This is the token gotten fro Hive = $token');

    chatRepo = ChatRepo(token);

    final ChatFormModel chatFormModel = ChatFormModel(
      message: chatFormData['message'], 
      receiverId: chatFormData['receiver_id'], 
      chatCode: chatFormData['chat_code'],
      receiverType: chatFormData['receiver_type']);

    try{  
      log('Attempting to send chat');
      final result = await chatRepo!.sendChat(chatFormModel);
      if (result.isLeft) {
        log('sending chat failed: ${result.left.status}');

        handleError('sending chat failed!');
      } else {
        log('sending chat successful');
        sendingChat = true;
        notifyListeners();
        // toastMessage('chat sent successfully', long: true);
      }

    }catch(ex, trace){
      log('Exception caught : $ex, with strace: $trace');
      toastMessage(ex.toString());
    }finally{
      isLoading = false;
      notifyListeners();
    }

    return sendingChat;
    
  }

  Future<Either<bool, List<Chat>>> getContactsRequest() async {
    isLoading = true;
    notifyListeners();

    final localDB = UserRepositoryImpl(
      HiveStorage(Hive.box(HiveKeys.appBox)),
    );

    final String token = localDB.getToken();
    log('This is the token gotten fro Hive = $token');

    final ChatRepo chatRepo = ChatRepo(token);

    log('Attempting to get contact list');
    final contactList = await chatRepo.getContactList();

    if (contactList.isLeft) {
      log('getting contacts failed: ${contactList.left.status}');

      handleError('contacts failed to download');
      isLoading = false;
      notifyListeners();
      return Left(gettingContacts);
    } else {
      log('getting contact list successful');
      toastMessage('contact list downloaded', long: false);
      isLoading = false;
      notifyListeners();

      return Right(contactList.right.message!.left.chats!);
    }
    
  }

  
  void toggleFavorites() {
    notifyListeners();
  }

  void toggleOnlineStatus() {
    notifyListeners();
  }

  void toggleSelected() {
    notifyListeners();
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