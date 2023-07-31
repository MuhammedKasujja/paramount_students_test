import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';

class DocumentItem extends StatelessWidget {
  final String name;
  final String size;
  final double radius;
  final bool canDownload;
  const DocumentItem({
    super.key,
    required this.name,
    required this.size,
    this.radius = 8,
    this.canDownload = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(top: 14, bottom: 14, left: 16),
      decoration: BoxDecoration(
        color: HexColor("#EDF4F9"),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        children: [
          const SizedBox(child: Icon(Icons.description)),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: sText(name, color: HexColor('#191C1C')),
                    ),
                    canDownload
                        ? const SizedBox.shrink()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(
                              Icons.lock,
                              color: HexColor('#767A7D'),
                            ),
                          )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: sText(size, color: HexColor("#A9ACAC"), size: 8),
                    ),
                    canDownload
                        ? const SizedBox.shrink()
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: sText(
                              'Document Verified',
                              color: HexColor("#A9ACAC"),
                              size: 8,
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
