import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/index.dart';

class ConfirmBarcodeLogin extends StatefulWidget {
  const ConfirmBarcodeLogin({Key? key}) : super(key: key);

  @override
  State<ConfirmBarcodeLogin> createState() => _ConfirmBarcodeLoginState();
}

class _ConfirmBarcodeLoginState extends State<ConfirmBarcodeLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: rightPadding(20),
              child: Row(
                children: [
                  const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  sText("Cancel", color: Colors.black)
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sText("Confirm Login", color: Colors.black, size: 30),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            sText("Please confirm the information below to proceed",
                color: Colors.black, size: 14),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sText("Ip Address", color: Colors.grey, size: 12),
                      sText("78.123.543.98", color: Colors.grey, size: 12),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sText("Location", color: Colors.grey, size: 12),
                      sText("Instanbul, Turkey", color: Colors.grey, size: 12),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sText("Device", color: Colors.grey, size: 12),
                      sText("Chrome v96.00987.98 (Windwos)",
                          color: Colors.grey, size: 12),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      sText("Time", color: Colors.grey, size: 12),
                      sText("12:90 IST Time", color: Colors.grey, size: 12),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Center(
                  child: MaterialButton(
                    height: 50,
                    minWidth: 380,
                    onPressed: () {
                      goTo(context, const IndexPage());
                    },
                    color: appYellowText,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: sText("Submit",
                        color: Colors.black, weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: MaterialButton(
                    height: 50,
                    color: Colors.grey[100],
                    minWidth: 380,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: sText("Cancel",
                        color: Colors.black, weight: FontWeight.w500),
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
