
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

import 'package:paramount_students/ui/base/base_view_model.dart';
import 'package:paramount_students/models/file.dart';
import 'package:paramount_students/models/file_operation.dart';

final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);


class DocumentViewModel extends BaseViewModel {
  DocumentUploadFormModel? documentUploadFormModel;
  dynamic docRequest;

  @override
  void close() {
    // TODO: implement close
    fileNameCont.dispose();
  }

  @override
  void init() {
    // TODO: implement init
  }

  bool isSuccess = false;
  bool isLoading = false;
  Map<String, dynamic> documentMap = {};
  //Document upload
  FilePickerResult? fileUpload0;

  String? fileName;

  Uint8List? fileByte;

  int? fileSize;

    // controller - filename
  TextEditingController fileNameCont = TextEditingController();

  void deleteUploadedDocument(){
    fileUpload0 = null;
    //clearing selected file from box
    localDB.deleteEntry(HiveKeys.file0);
    localDB.deleteEntry(HiveKeys.file1);
    localDB.deleteEntry(HiveKeys.file2);
    localDB.deleteEntry(HiveKeys.file3);
    notifyListeners();
  }

  Future<void> pickFile0(BuildContext context, String val, NavigatorState navigator, 
  {TextEditingController? controller, bool isAddingExtra = false}) async {
    final userFileName = await showUpdateDialog(context, val, navigator, controller: controller, mandatory: true);
    //clearing textfield text
    controller!.clear();

    fileUpload0 = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      withData: true,
    );
    if (fileUpload0 != null) {
      fileName = fileUpload0!.files.first.name;
      fileByte = fileUpload0!.files.first.bytes;
      fileSize = fileUpload0!.files.first.size;

      log('File name is $fileName');
      log('File size is $fileSize');
      //checking if user wants to add more than one document
      if(isAddingExtra == true){
      
        final FileOperation fileOperation = FileOperation(
            fileUpload0: fileUpload0,
            userFileName: userFileName,
            handleError: handleError,);
          
          fileOperation.savingFiles();
          log('hive storage length: ${localDB.boxLength()}');
      }
      //checking if user wants to replace documents
      if(localDB.boxLength() >= 3 && isAddingExtra == false){
        final currentIndex = localDB.boxLength() - 3;
        localDB.deleteEntry('file$currentIndex');
        localDB.saveFile(PickedFile(
          filePath0: fileUpload0!.files.first.path!, 
          userFileName0: userFileName!,
          fileName0: fileUpload0!.files.first.name), currentIndex);
      }
      if(localDB.boxLength() < 3){
        localDB.saveFile(PickedFile(
          filePath0: fileUpload0!.files.first.path!, 
          fileName0: fileUpload0!.files.first.name, 
          userFileName0: userFileName!), 0);
      }
      
    }
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
