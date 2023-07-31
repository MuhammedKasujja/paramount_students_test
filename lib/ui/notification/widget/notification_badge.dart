import 'package:flutter/material.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';

class NotificationBadge extends StatefulWidget {
  final int counter;
  const NotificationBadge({super.key, required this.counter});

  @override
  State<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends State<NotificationBadge> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        const Icon(Icons.notifications, color: Colors.amber, size: 25),
        Positioned(
          right: 1,
          top: 0,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: psError,
              ),
              padding: const EdgeInsets.all(2),
              constraints: const BoxConstraints(
                minHeight: 14,
                minWidth: 14,
              ),
              child: sText(widget.counter.toString(),
                  align: TextAlign.center, color: psWhite, size: 11)),
        ),
      ],
    );
  }
}
