import 'dart:developer';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/data/local_database.dart/local_db.dart';
import 'package:paramount_students/data/repository/chat/chat_repo.dart';
import 'package:paramount_students/data/repository/user/user_repository_impl.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/models/file.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/ui/chat/view_model/chat_view_model.dart';
import 'package:paramount_students/ui/chat/widgets/new_message.dart';
import 'package:dotted_border/dotted_border.dart';

  final localDB = UserRepositoryImpl(
    HiveStorage(Hive.box(HiveKeys.appBox)),
  );


class Modals {
  Future<void> openAttachmentModal({
    BuildContext? context, 
    NavigatorState? navigator, 
    Store? store,
    ChatViewModel? model})async{
    final isPortrait = MediaQuery.of(context!).orientation == Orientation.portrait; 
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final screenHeight = MediaQuery.of(context).size.height;
    final landscapeHeight = screenHeight;
    final numOfDocsAdded = localDB.boxLength() - 2;
    List carouselItems = [];
    
    await showModalBottomSheet(
      context: context, 
      builder: (_) {
        carouselItems.addAll(createCarouselItems([]));
        final portraitHeight = model!.fileUpload0 != null ? screenHeight * .61 : screenHeight * .4;
        return SingleChildScrollView(
          child: Container(
            height: isLandscape 
            ? landscapeHeight
            : portraitHeight,
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
            child: Column(
              children: [
                Row(
                  children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back, size: 18,),
                    onTap: () => Navigator.pop(context)),
                  const Spacing.meduimWidth(),
                  const Spacing.meduimWidth(),
                  sText('Upload Or Attach Files', size: 19, family: 'Poppins', weight: FontWeight.w500, align: TextAlign.center)
                  ],
                ),
                const Spacing.meduimHeight(),
                DottedBorder(
                  color: Colors.black,
                  strokeWidth: 1.0,
                  borderType: BorderType.RRect, 
                  radius: Radius.circular(20.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    height: model.fileUpload0 == null
                    ? 180 
                    : model.fileUpload0 != null && isPortrait
                    ? 110
                    : 90,
                    decoration: BoxDecoration(
                      color: psGrey6,
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: psGrey6,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: 
                      Column(
                        children: [
                          Column(
                          children: [
                            if(model.fileUpload0 == null)
                            GestureDetector(
                              child: Icon(Icons.upload_file_outlined, size: 60),
                              onTap: ()async{
                                await model.pickFile0(
                                  context, 
                                  "Provide File Name",
                                  store: store, 
                                  navigator!, 
                                  controller: model.fileNameCont);
                              },
                            ),
                            if(model.fileUpload0 == null)
                            const Spacing.smallHeight(),
                            if(model.fileUpload0 == null)
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: ()async{
                                    await model.pickFile0(
                                      context, 
                                      store: store,
                                      "Provide File Name", 
                                      navigator!, 
                                      controller: model.fileNameCont);
                                  },
                                  child: const Text('Choose', style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: appYellowText, fontSize: 18, fontWeight: FontWeight.bold),  
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: sText(' Your File Here', color: psGrey2, size: 18, weight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: model.fileUpload0 != null,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add_circle,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        sText(
                                          'Add More Documents',
                                          size: 14,
                                          color: appBlackText,
                                        ),
                                      ],
                                    ),
                                    onTap: ()async{
                                      if(localDB.boxLength() == 5 || store!.fileData.length == 3){
                                        log('maximum no of documents allowed has been reached');
                                        toastMessage("You can't add anymore documents", long: true);
                                        return;
                                      }
                                      await model.pickFile0(
                                        context, 
                                        "Provide File Name", 
                                        navigator!,
                                        store: store, 
                                        controller: model.fileNameCont,
                                        isAddingExtra: true);
                                    },
                                  ),
                                  const Spacing.smallHeight(),
                                ],
                              ),
                            ),
                            const Spacing.tinyHeight(),
                            Text(
                              'Please Note That You Can Only Upload JPEG, PNG, PDF Files That Do Not Exceed 5MB.',
                              style: TextStyle(
                                fontSize: 12, 
                              ),
                              textAlign: TextAlign.center,
                              maxLines: null
                              )
                          ],
                        )
                      ],
                    )
                  ),
                ),
                if(model.fileUpload0 != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(isLandscape)
                    const Spacing.meduimHeight(),
                    if(isPortrait)
                    const Spacing.largeHeight(),
                    sText('Or Choose Recent Files', color: psGrey2, size: 18, weight: FontWeight.bold),
                    const Spacing.meduimHeight(),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        height: isLandscape ? 120 : 150,
                        aspectRatio: 2/4,
                        viewportFraction: isLandscape ? .6 : 0.7,
                        enableInfiniteScroll: false,
                        pageSnapping: true,
                        padEnds: false
                      ),
                      itemCount: numOfDocsAdded,
                      itemBuilder: (BuildContext context,
                          int index, int index2) {
                        return GestureDetector(
                          onTap: (){
                            if(localDB.boxLength() == 5 || store!.fileData.length == 3){
                              log('maximum no of documents allowed has been reached');
                              toastMessage("You can't add anymore documents", long: true);
                              return;
                            }
                            store.saveFileData(store.fileData[index]);
                            model.documentList = store.fileData;
                            model.updateTextField();
                            navigator!.pop();         
                          
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: psGrey7,
                              shape: BoxShape.rectangle,
                              border: Border.all(color: psGrey6, width: 2),
                              borderRadius: BorderRadius.circular(18)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: Text(
                                    carouselItems[index]['name$index'], 
                                    maxLines: null,
                                    style: TextStyle(
                                      color: psGrey2, fontSize: 17, fontWeight: FontWeight.bold
                                    )
                                    )),
                                const Spacing.meduimHeight(),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.file_open_sharp, size: 35, color: carouselItems[index]['name$index'].split('.')[1] == 'pdf'
                                    ? psError
                                    : carouselItems[index]['name$index'].split('.')[1] == 'doc'
                                    ? psInfo
                                    : appYellowText),
                                    const Spacing.smallWidth(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        sText('File', color: psGrey2, size: 17, weight: FontWeight.bold),
                                        sText('${((carouselItems[index]['size$index']/ 1024)/1024).toStringAsFixed(2)}MB')
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ),
                        );
                      }                 
                    )                        
                  ],
                )
              ],
            ),
          ),
        );
      },
      backgroundColor: psWhite,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }

  List createCarouselItems(List carouselItems){
    //retrieving the appropriate file based on the documents the user added in the chat
    switch (localDB.boxLength()) {
      case 3:
        final file = localDB.getFile(0);
        carouselItems.addAll([
          {
          'size0': file.fileSize0,
          'name0': file.fileName0,
          'user_name0': file.userFileName0,
          'path0': file.filePath0
          }
        ]);
        break;
      case 4:
        final file = localDB.getFile(1);
        carouselItems.addAll([
          {
          'size0': file.fileSize0,
          'name0': file.fileName0,
          'user_name0': file.userFileName0,
          'path0': file.filePath0
          },
          {
          'size1': file.fileSize1,
          'name1': file.fileName1,
          'user_name1': file.userFileName1,
          'path1': file.filePath1
          }
        ]);
        break;
      case 5:
        final file = localDB.getFile(2);
        carouselItems.addAll([
          {
          'size0': file.fileSize0,
          'name0': file.fileName0,
          'user_name0': file.userFileName0,
          'path0': file.filePath0
          },
          {
          'size1': file.fileSize1,
          'name1': file.fileName1,
          'user_name1': file.userFileName1,
          'path1': file.filePath1
          },
          {
          'size2': file.fileSize2,
          'name2': file.fileName2,
          'user_name2': file.userFileName2,
          'path2': file.filePath2
          }
        ]);
        break;
      default:
        break;
    }

    return carouselItems;
  }

  Future<void> openTextFieldModal({
      BuildContext? context, 
      bool? isMe, 
      String? instUserType, 
      String? studentUserType,
      int? studentId,
      int? instId,
      dynamic chatCode,
      String? studentFullName,
      String? instName,
      String? studentPhotoUrl,
      String? instPhotoUrl,
      FocusNode? focusNode
    })async{
    return showModalBottomSheet(
      context: context!, 
      builder: (_) => OrientationBuilder(
      builder: (context, Orientation orientation) {
          if (orientation == Orientation.portrait ) {
              Navigator.pop(context);
            }
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
            child: NewMessage(
              userType: isMe! ? instUserType : studentUserType, 
              chatCode: chatCode,
              receiverId: isMe ? instId : studentId, 
              senderName: isMe ? studentFullName : instName,
              senderPictureUrl: isMe ? studentPhotoUrl : instPhotoUrl,
              isMe: isMe,
              newMsgFocusNode: focusNode!),
            );
        }
      ),
      backgroundColor: psGrey1,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    );
  }
}