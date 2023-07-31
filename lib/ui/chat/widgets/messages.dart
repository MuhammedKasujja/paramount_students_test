import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import './day.dart';

class Messages extends StatefulWidget {
  final List? chatsPerMonth;
  final String? userName;
  final String? contactName;
  Messages({
    this.contactName,
    this.userName,
    this.chatsPerMonth,});


  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  
  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    List updatedDaysList = [];
    final daysList = List.generate(31, (index) => []);
        
    for(var i = 0; i < daysList.length; i++){
      daysList[i].addAll(widget.chatsPerMonth!.where((chat) => chat['created_at'].day == i+1));
    }

    updatedDaysList.addAll(daysList.where((element) => element.isNotEmpty).toList());
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: updatedDaysList.map((dayList) => 
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Divider(thickness: 1, color: psGrey3),
                  ),
                  const Spacing.tinyWidth(),
                  sText(DateFormat.MMMd().format(dayList[0]['created_at']),
                  size: isLandscape ? 16 : 15, weight: FontWeight.bold), 
                  const Spacing.tinyWidth(),
                  const Expanded(
                    flex: 1,
                    child: Divider(thickness: 1, color: psGrey3),
                  ),
                ],
              ),
              Day(dayList, contactName: widget.contactName, userName: widget.userName,),
            ],
          ),
        ).toList(),
      ),
    );
  }
}
