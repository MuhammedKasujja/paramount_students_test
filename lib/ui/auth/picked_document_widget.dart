import 'package:flutter/material.dart';

class PickedDocumentWidget extends StatelessWidget {
  final String filename;
  final dynamic fileSize;
  final VoidCallback deleteFileFunctionality;
  const PickedDocumentWidget(
      {required this.deleteFileFunctionality,
      required this.fileSize,
      required this.filename,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.file_copy,
        ),
        const SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                filename,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.5,
                ),
              ),
              Text(
                '${((fileSize / 1024) / 1024).toStringAsFixed(2)} MB',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                Text(
                  'uploaded',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5.0,
            ),
            GestureDetector(
              onTap: deleteFileFunctionality,
              child: Container(
                height: 40.0,
                width: 60.0,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
