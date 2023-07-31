import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/chat/chat_repo.dart';
import 'package:paramount_students/data/repository/programs/programs_repo.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/response/programs/program_app_res.dart';
import 'package:paramount_students/models/file.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/chat/view_model/chat_view_model.dart';

final localDB = UserRepositoryImpl(
  HiveStorage(Hive.box(HiveKeys.appBox)),
);

class FileOperation{
  DocumentUploadFormModel? documentUploadFormModel;
  ProgramsRepo? programsRepo;
  ChatRepo? chatRepo;
  FilePickerResult? fileUpload0;
  dynamic docRequest;
  List<Map<String, dynamic>> fileDetails = [];
  Function? deleteUploadedDocument;
  Function handleError;
  Store? store;
  bool withStudentData;
  String? userFileName;
  bool isChat;


  FileOperation({
    this.programsRepo,
    this.chatRepo,
    this.fileUpload0,
    this.store,
    this.userFileName,
    this.deleteUploadedDocument,
    required this.handleError,
    this.withStudentData = false,
    this.isChat = false
  });

  void savingFiles(){
    switch (localDB.boxLength()) {
      case 3:
        final prevUserFileName0 = localDB.getFile(0).userFileName0;
        final prevFileName0 = localDB.getFile(0).fileName0;
        final prevFilePath0 = localDB.getFile(0).filePath0;
        final prevSize0 = localDB.getFile(0).fileSize0;
        localDB.saveFile(
          PickedFile(
          userFileName0: prevUserFileName0,
          fileSize0: prevSize0,
          fileName0: prevFileName0,
          filePath0: prevFilePath0,
          filePath1: fileUpload0!.files.first.path!, 
          fileName1: fileUpload0!.files.first.name,
          fileSize1: fileUpload0!.files.first.size,
          userFileName1: userFileName!), 1);
  
        break;
      case 4:
        final prevUserFileName0 = localDB.getFile(1).userFileName0;
        final prevFileName0 = localDB.getFile(1).fileName0;
        final prevSize0 = localDB.getFile(1).fileSize0;
        final prevFilePath0 = localDB.getFile(1).filePath0;
        final prevUserFileName1 = localDB.getFile(1).userFileName1;
        final prevFileName1 = localDB.getFile(1).fileName1;
        final prevSize1 = localDB.getFile(1).fileSize1;
        final prevFilePath1 = localDB.getFile(1).filePath1;
        localDB.saveFile(
          PickedFile(
          fileName0: prevFileName0,
          filePath0: prevFilePath0,
          fileSize0: prevSize0,
          userFileName0: prevUserFileName0,
          fileName1: prevFileName1,
          userFileName1: prevUserFileName1,
          filePath1: prevFilePath1,
          fileSize1: prevSize1,
          filePath2: fileUpload0!.files.first.path!, 
          fileName2: fileUpload0!.files.first.name,
          fileSize2: fileUpload0!.files.first.size,
          userFileName2: userFileName!), 2);
        break;
       case 5:
        final prevUserFileName0 = localDB.getFile(2).userFileName0;
        final prevFileName0 = localDB.getFile(2).fileName0;
        final prevFilePath0 = localDB.getFile(2).filePath0;
        final prevSize0 = localDB.getFile(2).fileSize0;
        final prevUserFileName1 = localDB.getFile(2).userFileName1;
        final prevFileName1 = localDB.getFile(2).fileName1;
        final prevSize1 = localDB.getFile(2).fileSize1;
        final prevFilePath1 = localDB.getFile(2).filePath1;
        final prevUserFileName2 = localDB.getFile(2).userFileName2;
        final prevFileName2 = localDB.getFile(2).fileName2;
        final prevSize2 = localDB.getFile(2).fileSize2;
        final prevFilePath2 = localDB.getFile(2).filePath2;
        localDB.saveFile(
          PickedFile(
          fileName0: prevFileName0,
          fileSize0: prevSize0,
          userFileName0: prevUserFileName0,
          filePath0: prevFilePath0,
          fileName1: prevFileName1,
          fileSize1: prevSize1,
          userFileName1: prevUserFileName1,
          filePath1: prevFilePath1,
          fileName2: prevFileName2,
          fileSize2: prevSize2,
          userFileName2: prevUserFileName2,
          filePath2: prevFilePath2,
          filePath3: fileUpload0!.files.first.path!, 
          fileName3: fileUpload0!.files.first.name,
          fileSize3: fileUpload0!.files.first.size,
          userFileName3: userFileName!), 3);
        break;
      default:
        break;
    }
  }

  Future<List<Map<String, dynamic>>> sortingFilesForRequest()async{
    log('boxlengthbeforesaving2ndfile: ${localDB.boxLength()}');

    switch (localDB.boxLength()) {
      case 3:
        documentUploadFormModel = DocumentUploadFormModel(
            additionalDocPath: localDB.getFile(0).filePath0,
            additionalDocFileName: localDB.getFile(0).fileName0,
            additionalDocFolderName: isChat ? 'ChatNewMessage' : 'universitiesProgramApplication');
        docRequest = isChat ? await chatRepo!.uploadDocumentForm(documentUploadFormModel!) : await programsRepo!.updateDocumentForm(documentUploadFormModel!);

        if (docRequest!.isLeft) {
          log('adding extra document failed: ${docRequest!.left.responseBody}');
          //clearing selected file from hive storage
          deleteUploadedDocument!();
          handleError(docRequest!.left.responseBody);
        } else {
          log(withStudentData ? 'updating student data successful' : 'adding extra document successful');
          
          final updatedFileName = localDB.getFile(0).userFileName0;
          
          store!.saveFileData({
            updatedFileName!.replaceAll(RegExp(r' '), '_'): docRequest!.right.responseBody!
          });

          log('stored data: ${store!.fileData}');
        }
        break;
      case 4:
        if(!isChat){
          documentUploadFormModel = DocumentUploadFormModel(
            additionalDocPath: localDB.getFile(1).filePath0,
            additionalDocFileName: localDB.getFile(1).fileName0,
            additionalDocFolderName: 'universitiesProgramApplication');
          docRequest = await programsRepo!.updateDocumentForm(documentUploadFormModel!);

          if (docRequest!.isLeft) {
            log('adding extra document failed: ${docRequest!.left.responseBody}');
            //clearing selected file from hive storage
            deleteUploadedDocument!();
            handleError(docRequest!.left.responseBody);
          } else {
            fileDetails.add({
              localDB.getFile(1).userFileName0!.replaceAll(RegExp(r' '), '_') : docRequest.right.responseBody
            });

            documentUploadFormModel = DocumentUploadFormModel(
              additionalDocPath: localDB.getFile(1).filePath1,
              additionalDocFileName: localDB.getFile(1).fileName1,
              additionalDocFolderName: 'universitiesProgramApplication');
            docRequest = await programsRepo!.updateDocumentForm(documentUploadFormModel!);

            if (docRequest!.isLeft) {
              log('adding extra documents failed: ${docRequest!.left.responseBody}');
              //clearing variable to free up resources
              fileDetails.clear();
              //clearing selected file from hive storage
              deleteUploadedDocument!();
              handleError(docRequest!.left.responseBody);
            }else{
              log(withStudentData ? 'updating student data successful' :'adding extra document successful');
            
              final updatedFileName = localDB.getFile(1).userFileName1;

              store!.saveFileData({ 
                fileDetails[0].keys.toList()[0]: fileDetails[0].values.toList()[0]
              });

              store!.saveFileData({ 
                updatedFileName!.replaceAll(RegExp(r' '), '_'): docRequest!.right.responseBody!
              });

              log('stored data: ${store!.fileData}');
            }
          }
        }else{
          documentUploadFormModel = DocumentUploadFormModel(
            additionalDocPath: localDB.getFile(1).filePath1,
            additionalDocFileName: localDB.getFile(1).fileName1,
            additionalDocFolderName: 'ChatNewMessage');
          docRequest = await chatRepo!.uploadDocumentForm(documentUploadFormModel!);

          if (docRequest!.isLeft) {
            log('adding extra documents failed: ${docRequest!.left.responseBody}');
            //clearing variable to free up resources
            fileDetails.clear();
            //clearing selected file from hive storage
            deleteUploadedDocument!();
            handleError(docRequest!.left.responseBody);
          }else{
            log('adding extra document successful');
          
            final updatedFileName = localDB.getFile(1).userFileName1;

            store!.saveFileData({ 
              updatedFileName!.replaceAll(RegExp(r' '), '_'): docRequest!.right.responseBody!
            });

            log('stored data: ${store!.fileData}');
          }
        }

        break;
      case 5:
        if(!isChat){
          documentUploadFormModel = DocumentUploadFormModel(
            additionalDocPath: localDB.getFile(2).filePath0,
            additionalDocFileName: localDB.getFile(2).fileName0,
            additionalDocFolderName: 'universitiesProgramApplication');
          docRequest = await programsRepo!.updateDocumentForm(documentUploadFormModel!);

          if (docRequest!.isLeft) {
            log('adding extra document failed: ${docRequest!.left.responseBody}');
            //clearing selected file from hive storage
            deleteUploadedDocument!();
            handleError(docRequest!.left.responseBody);
          } else {
            fileDetails.add({
              localDB.getFile(2).userFileName0!.replaceAll(RegExp(r' '), '_') : docRequest.right.responseBody
            });

            documentUploadFormModel = DocumentUploadFormModel(
              additionalDocPath: localDB.getFile(2).filePath1,
              additionalDocFileName: localDB.getFile(2).fileName1,
              additionalDocFolderName: 'universitiesProgramApplication');
            docRequest = await programsRepo!.updateDocumentForm(documentUploadFormModel!);

            if (docRequest!.isLeft) {
              log('adding extra documents failed: ${docRequest!.left.responseBody}');
              //clearing variable to free up resources
              fileDetails.clear();
              //clearing selected file from hive storage
              deleteUploadedDocument!();
              handleError(docRequest!.left.responseBody);
            }else{
              fileDetails.add({
              localDB.getFile(2).userFileName1!.replaceAll(RegExp(r' '), '_') : docRequest.right.responseBody
              });

              documentUploadFormModel = DocumentUploadFormModel(
                additionalDocPath: localDB.getFile(2).filePath2,
                additionalDocFileName: localDB.getFile(2).fileName2,
                additionalDocFolderName: 'universitiesProgramApplication');
              docRequest = await programsRepo!.updateDocumentForm(documentUploadFormModel!);

              if (docRequest!.isLeft) {
                log('adding extra documents failed: ${docRequest!.left.responseBody}');
                //clearing variable to free up resources
                fileDetails.clear();
                //clearing selected file from hive storage
                deleteUploadedDocument!();
                handleError(docRequest!.left.responseBody);
              }else{
                log(withStudentData ? 'updating student data successful' :'adding extra document successful');
            
                final updatedFileName = localDB.getFile(1).userFileName1;

                store!.saveFileData({ 
                  fileDetails[0].keys.toList()[0]: fileDetails[0].values.toList()[0]
                });

                store!.saveFileData({ 
                  fileDetails[1].keys.toList()[0]: fileDetails[1].values.toList()[0]
                });

                store!.saveFileData({ 
                  updatedFileName!.replaceAll(RegExp(r' '), '_'): docRequest!.right.responseBody!
                });

                log('stored data: ${store!.fileData}');
              }
              
            }
          }
        }else{
          documentUploadFormModel = DocumentUploadFormModel(
            additionalDocPath: localDB.getFile(2).filePath2,
            additionalDocFileName: localDB.getFile(2).fileName2,
            additionalDocFolderName: 'ChatNewMessage');
            docRequest = await chatRepo!.uploadDocumentForm(documentUploadFormModel!);

            if (docRequest!.isLeft) {
              log('adding extra documents failed: ${docRequest!.left.responseBody}');
              //clearing variable to free up resources
              fileDetails.clear();
              //clearing selected file from hive storage
              deleteUploadedDocument!();
              handleError(docRequest!.left.responseBody);
            }else{
              log('adding extra document successful');
          
              final updatedFileName = localDB.getFile(2).userFileName2;

              store!.saveFileData({ 
                updatedFileName!.replaceAll(RegExp(r' '), '_'): docRequest!.right.responseBody!
              });
            
              log('stored data: ${store!.fileData}');
            }
        }
        break;
      default:
        break;
    }

    return store!.fileData;
  }
}