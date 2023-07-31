import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/auth/login/confirm_barcode_login.dart';

class QRCodeScanLogin extends StatefulWidget {
  const QRCodeScanLogin({Key? key}) : super(key: key);

  @override
  State<QRCodeScanLogin> createState() => _QRCodeScanLoginState();
}

class _QRCodeScanLoginState extends State<QRCodeScanLogin> {
  var base64Images;
  File? listFiles;
  attachDoc() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image, withData: true);
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      // List<PlatformFile> listFiles = result.files;
      print(files.first.path);
      listFiles = files.first;
      base64Images = base64Encode(listFiles!.readAsBytesSync());
      setState(() {});
      goTo(context, const ConfirmBarcodeLogin());
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: sText("Scan QR Code", color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            displayLocalImage("barcode.png", radius: 0),
            Column(
              children: [
                sText("Scan QR Code To Login", color: Colors.black),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      attachDoc();
                    },
                    color: appYellowText,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        displayLocalImage("upload_file.png", radius: 0),
                        const SizedBox(
                          width: 5,
                        ),
                        sText("Upload Photo", color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
