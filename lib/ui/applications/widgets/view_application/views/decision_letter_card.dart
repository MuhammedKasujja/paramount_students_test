import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/strings.dart';
import 'package:paramount_students/ui/applications/models/program_res.dart';
import 'package:paramount_students/ui/applications/widgets/view_application/document_item.dart';

import 'base_collapse_card.dart';

class DecisionLetterCard extends StatelessWidget {
  final Letters? letters;
  const DecisionLetterCard({super.key, required this.letters});

  @override
  Widget build(BuildContext context) {
    final letter = letters?.data;
    return BaseCollapseCard(
      title: PSStrings.psDecisionLater,
      body: letter != null
          ? Column(
              children: [
                DocumentItem(
                  name: letter.name,
                  size: '5.09 MB',
                  canDownload: true,
                  radius: 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  height: 51,
                  minWidth: 380,
                  onPressed: () {
                    downloadFile(letter.url);
                  },
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: appYellowText),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.download),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Download"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          : Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                Center(child: Text("Attachment not available")),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
    );
  }
}
