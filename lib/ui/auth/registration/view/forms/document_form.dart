import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/ui/auth/picked_document_widget.dart';
import 'package:paramount_students/ui/auth/registration/view_model/registeration_view_model.dart';
import 'package:paramount_students/utils/ps_color.dart';

class DocumentForm extends StatefulWidget {
  const DocumentForm({Key? key, required this.model}) : super(key: key);
  final RegisterationViewModel model;

  @override
  State<DocumentForm> createState() => _DocumentFormState();
}

class _DocumentFormState extends State<DocumentForm> {
  final SizedBox titleSeparator = const SizedBox(
    height: 8,
  );

  final SizedBox fieldSeparator = const SizedBox(
    height: 18,
  );

  final requiredField = Text(
    ' *',
    style: TextStyle(color: HexColor('#DD3730')),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          fieldSeparator,
          widget.model.fileUpload0 == null
              ? Row(
                  children: [
                    Text(PSStrings.psUploadHighSchoolGrade),
                    requiredField,
                  ],
                )
              : PickedDocumentWidget(
                  deleteFileFunctionality: () async {
                    await widget.model.deleteUploadedDocument(
                      fileIndex: 0,
                    );
                    setState(() {});
                  },
                  fileSize: widget.model.fileSizes[0]!,
                  filename: widget.model.fileNames[0]!,
                ),
          titleSeparator,
          MaterialButton(
            height: 50,
            minWidth: double.infinity,
            onPressed: widget.model.pickFile0,
            elevation: 0,
            textColor: Colors.black,
            color:
                widget.model.fileUpload0 == null ? Colors.white : Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              //border side
              side: BorderSide(
                color:
                    widget.model.fileUpload0 != null ? psSuccess : Colors.amber,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload_file_rounded,
                  color: widget.model.fileUpload0 == null
                      ? const Color.fromRGBO(25, 28, 28, 0.7)
                      : Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text(
                    widget.model.fileUpload0 == null
                        ? PSStrings.psUploadDocument
                        : PSStrings.psReplaceDocument,
                    style: widget.model.fileUpload0 == null
                        ? PSTextStyle.uploadButtonStyle
                        : PSTextStyle.replaceButtonStyle,
                  ),
                ),
              ],
            ),
          ),
          titleSeparator,
          Text(
            PSStrings.psUploadHint1,
            style: PSTextStyle.uploadHintStyle,
          ),
          fieldSeparator,
          widget.model.fileUpload1 == null
              ? Row(
                  children: [
                    Text(PSStrings.psUploadHighSchoolCert),
                    requiredField,
                  ],
                )
              : PickedDocumentWidget(
                  deleteFileFunctionality: () async {
                    await widget.model.deleteUploadedDocument(
                      fileIndex: 1,
                    );
                    setState(() {});
                  },
                  fileSize: widget.model.fileSizes[1]!,
                  filename: widget.model.fileNames[1]!,
                ),
          titleSeparator,
          MaterialButton(
            height: 50,
            minWidth: double.infinity,
            onPressed: widget.model.pickFile1,
            elevation: 0,
            textColor: Colors.black,
            color:
                widget.model.fileUpload1 == null ? Colors.white : Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color:
                    widget.model.fileUpload1 != null ? psSuccess : Colors.amber,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload_file_rounded,
                  color: widget.model.fileUpload1 == null
                      ? const Color.fromRGBO(25, 28, 28, 0.7)
                      : Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text(
                    widget.model.fileUpload1 == null
                        ? PSStrings.psUploadDocument
                        : PSStrings.psReplaceDocument,
                    style: widget.model.fileUpload1 == null
                        ? PSTextStyle.uploadButtonStyle
                        : PSTextStyle.replaceButtonStyle,
                  ),
                ),
              ],
            ),
          ),
          titleSeparator,
          Text(
            PSStrings.psUploadHint1,
            style: PSTextStyle.uploadHintStyle,
          ),
          fieldSeparator,
          widget.model.fileUpload2 == null
              ? Row(
                  children: [
                    Text(PSStrings.psUploadFormalPhoto),
                    requiredField,
                  ],
                )
              : PickedDocumentWidget(
                  deleteFileFunctionality: () async {
                    await widget.model.deleteUploadedDocument(
                      fileIndex: 2,
                    );
                    setState(() {});
                  },
                  fileSize: widget.model.fileSizes[2]!,
                  filename: widget.model.fileNames[2]!,
                ),
          titleSeparator,
          MaterialButton(
            height: 50,
            minWidth: double.infinity,
            onPressed: widget.model.pickFile2,
            elevation: 0,
            textColor: Colors.black,
            color:
                widget.model.fileUpload2 == null ? Colors.white : Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color:
                    widget.model.fileUpload2 != null ? psSuccess : Colors.amber,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload_file_rounded,
                  color: widget.model.fileUpload2 == null
                      ? const Color.fromRGBO(25, 28, 28, 0.7)
                      : Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text(
                    widget.model.fileUpload2 == null
                        ? PSStrings.psUploadDocument
                        : PSStrings.psReplaceDocument,
                    style: widget.model.fileUpload2 == null
                        ? PSTextStyle.uploadButtonStyle
                        : PSTextStyle.replaceButtonStyle,
                  ),
                ),
              ],
            ),
          ),
          titleSeparator,
          Text(
            PSStrings.psUploadHint2,
            style: PSTextStyle.uploadHintStyle,
          ),
          fieldSeparator,
          widget.model.fileUpload3 == null
              ? Row(
                  children: [
                    Text(PSStrings.psUploadID),
                    requiredField,
                  ],
                )
              : PickedDocumentWidget(
                  deleteFileFunctionality: () async {
                    await widget.model.deleteUploadedDocument(
                      fileIndex: 3,
                    );
                    setState(() {});
                  },
                  fileSize: widget.model.fileSizes[3]!,
                  filename: widget.model.fileNames[3]!,
                ),
          titleSeparator,
          MaterialButton(
            height: 50,
            minWidth: double.infinity,
            onPressed: widget.model.pickFile3,
            elevation: 0,
            textColor: Colors.black,
            color:
                widget.model.fileUpload3 == null ? Colors.white : Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color:
                    widget.model.fileUpload3 != null ? psSuccess : Colors.amber,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload_file_rounded,
                  color: widget.model.fileUpload3 == null
                      ? const Color.fromRGBO(25, 28, 28, 0.7)
                      : Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text(
                    widget.model.fileUpload3 == null
                        ? PSStrings.psUploadDocument
                        : PSStrings.psReplaceDocument,
                    style: widget.model.fileUpload3 == null
                        ? PSTextStyle.uploadButtonStyle
                        : PSTextStyle.replaceButtonStyle,
                  ),
                ),
              ],
            ),
          ),
          titleSeparator,
          Text(
            PSStrings.psUploadHint2,
            style: PSTextStyle.uploadHintStyle,
          ),
          fieldSeparator,
          widget.model.fileUpload4 == null
              ? Text(PSStrings.psUploadPassport)
              : PickedDocumentWidget(
                  deleteFileFunctionality: () async {
                    await widget.model.deleteUploadedDocument(
                      fileIndex: 4,
                    );
                    setState(() {});
                  },
                  fileSize: widget.model.fileSizes[4]!,
                  filename: widget.model.fileNames[4]!,
                ),
          titleSeparator,
          MaterialButton(
            height: 50,
            minWidth: double.infinity,
            onPressed: widget.model.pickFile4,
            elevation: 0,
            textColor: Colors.black,
            color:
                widget.model.fileUpload4 == null ? Colors.white : Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color:
                    widget.model.fileUpload4 != null ? psSuccess : Colors.amber,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload_file_rounded,
                  color: widget.model.fileUpload4 == null
                      ? const Color.fromRGBO(25, 28, 28, 0.7)
                      : Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text(
                    widget.model.fileUpload4 == null
                        ? PSStrings.psUploadDocument
                        : PSStrings.psReplaceDocument,
                    style: widget.model.fileUpload4 == null
                        ? PSTextStyle.uploadButtonStyle
                        : PSTextStyle.replaceButtonStyle,
                  ),
                ),
              ],
            ),
          ),
          titleSeparator,
          Text(
            PSStrings.psUploadHint2,
            style: PSTextStyle.uploadHintStyle,
          ),
          fieldSeparator,
        ],
      ),
    );
  }
}
