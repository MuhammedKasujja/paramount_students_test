import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';

class ChatNotificationBadge extends StatefulWidget {
  final int counter;
  const ChatNotificationBadge({super.key, required this.counter});

  @override
  State<ChatNotificationBadge> createState() => _ChatNotificationBadgeState();
}

class _ChatNotificationBadgeState extends State<ChatNotificationBadge> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        const Icon(Icons.notifications, color: Colors.amber, size: 28),
        Positioned(
          right: 2,
          top: 13,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: psError,
            ),
            padding: const EdgeInsets.all(2),
            constraints: const BoxConstraints(
              minHeight: 14,
              minWidth: 14,
            ),
            child: sText(widget.counter.toString(), align: TextAlign.center, color: psWhite, size: 11)
          ),
        ),
      ],
    );
  }
}
