import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/app_utils/widgets/app_textfield.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/ui/auth/picked_document_widget.dart';
import 'package:paramount_students/ui/base/base_view.dart';
import 'package:paramount_students/ui/custom/menu_drawer.dart';
import 'package:paramount_students/ui/documents/view_model/document_view_model.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({Key? key}) : super(key: key);

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  List<ListPrograms> documentUploaded = [
    ListPrograms(name: "High School Marksheet", id: 1),
    ListPrograms(name: "High School Certificate", id: 2),
    ListPrograms(name: "Formal Photo", id: 3),
    ListPrograms(name: "LocalID Card", id: 4),
    ListPrograms(name: "Passport Front", id: 5),
    ListPrograms(name: "High School Marksheet", id: 6)
  ];

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final navigator = Navigator.of(context);
    return BaseView<DocumentViewModel>(
      model: DocumentViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar:  AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: appBlackText),
        ),
        drawer: const MenuDrawer(),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sText("Documents",
                      color: Colors.black, size: 20),
                ],
              ),
              const Spacing.meduimHeight(),
              Expanded(
                child: ListView(
                  children: [
                    const AppTextField(
                      textInputType: TextInputType.text,
                      backgroundColor: psInfoBg,
                      prefixIcon: Icon(
                        Icons.file_present_rounded,
                        color: appBlackText,
                      ),
                      enabled: false,
                      hintText: 'High Shool MarkSheet.pdf',
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const AppTextField(
                      textInputType: TextInputType.text,
                      backgroundColor: psInfoBg,
                      prefixIcon: Icon(
                        Icons.file_present_rounded,
                        color: appBlackText,
                      ),
                      enabled: false,
                      hintText: 'High School Certificate.pdf',
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const AppTextField(
                      textInputType: TextInputType.text,
                      backgroundColor: psInfoBg,
                      prefixIcon: Icon(
                        Icons.file_present_rounded,
                        color: appBlackText,
                      ),
                      enabled: false,
                      hintText: 'Formal Photo.jpg',
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const AppTextField(
                      backgroundColor: psInfoBg,
                      enabled: false,
                      hintText: 'Local ID Num.jpg',
                      prefixIcon: Icon(
                        Icons.file_present_rounded,
                        color: appBlackText,
                      ),
                      textInputType: TextInputType.text,
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const AppTextField(
                      backgroundColor: psInfoBg,
                      enabled: false,
                      hintText: 'Passport Front.jpg',
                      prefixIcon: Icon(
                        Icons.file_present_rounded,
                        color: appBlackText,
                      ),
                      textInputType: TextInputType.text,
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1,
                      color: psBlack1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if(model!.fileUpload0 == null)
                    GestureDetector(
                      child:  Row(
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
                      onTap: () async {
                        await model.pickFile0(
                          context!, 
                          "Provide File Name", 
                          navigator, 
                          controller: model.fileNameCont,);
                      },
                    ),
                    if(model.fileUpload0 != null)
                    PickedDocumentWidget(
                      deleteFileFunctionality: (){
                        model.deleteUploadedDocument();
                      },
                      fileSize: model.fileSize!,
                      filename: model.fileName!,
                    ),
                    Visibility(
                      visible: model.fileUpload0 != null,
                      child: Column(
                        children: [
                          const Spacing.smallHeight(),
                          MaterialButton(
                            height: 50,
                            minWidth: double.infinity,
                            onPressed: () async {
                              await model.pickFile0(
                                context!, 
                                "Provide File Name", 
                                navigator, 
                                controller: model.fileNameCont);
                            },
                            elevation: 0,
                            textColor: Colors.black,
                            color:Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              //border side
                              side: const BorderSide(
                                color: psSuccess,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.upload_file_rounded,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                                  child: Text(
                                    PSStrings.psReplaceDocument,
                                    style: PSTextStyle.replaceButtonStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacing.smallHeight()
                        ],
                      ),
                    ),
                    Visibility(
                      visible: model.fileUpload0 != null,
                      child: Column(
                        children: [
                          const Spacing.smallHeight(),
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
                              if(localDB.boxLength() == 5){
                                log('maximum no of documents allowed has been reached');
                                toastMessage("You can't add anymore documents", long: true);
                                return;
                              }
                              await model.pickFile0(
                                context!, 
                                "Provide File Name", 
                                navigator, 
                                controller: model.fileNameCont,
                                isAddingExtra: true);
                            }
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    sText(
                      'You Can Only Upload Files Up to 10MB In Size Each From The Following Types: JPEG, GIF, PNG, and PDF. Please Make Sure Tha The Image Is Not Blurry Or Distorted, And Has Plenty Of Contrast. Remember That They Should Be Legible When Printed Out. The Documents Must Be Upright (Not Upside Down) And In Portrait Mode (Taller Rather Than Wider)',
                      size: 13,
                      color: appBlackText,
                      maxLines: 8,
                    ),
                    if (!isLandscape)
                      const SizedBox(
                        height: 80,
                      ),
                    if (isLandscape)
                      const SizedBox(
                        height: 50,
                      ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
