import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:paramount_students/models/store.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import '../enum_constants.dart';

class TitleBar extends StatefulWidget {
    final UserActions? action;
    final Function cancel;
    final bool isTyping;
    final Function openModal;
    final String? name;
    TitleBar(this.action, this.cancel, this.isTyping, this.name, this.openModal);


  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Container(
      decoration: BoxDecoration(color: widget.action != null && isLandscape ? psGrey6 : Colors.transparent),

      padding: EdgeInsets.only(top: 35),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back, color: appBlackText), 
                    onTap: () {
                      //clearing file data from store to free up resources
                      Provider.of<Store>(context, listen: false).clearFileData();
                      Navigator.pop(context);
                    }
                  ),
                  if(!isLandscape)
                  const Spacing.smallWidth(),
                  if(isLandscape)
                  const Spacing.meduimWidth(),
                  Stack(
                    children: [

                      CircleAvatar(
                        radius: 20,

                        backgroundColor: psGrey4,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: psWhite,
                          ),
                          padding: EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: psSuccess,
                          ),
                          constraints: const BoxConstraints(
                            minHeight: 14,
                            minWidth: 14,
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if(!isLandscape)
                  const Spacing.smallWidth(),
                  if(isLandscape)
                  const Spacing.meduimWidth(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sText(widget.name, color: appBlackText, weight: FontWeight.bold, size: isLandscape ? 17 : 15),
                      if(widget.isTyping)
                      sText('typing...', size: 12)
                    ],
                  ),
                ],),
                Row(
                  children: [
                    if(isLandscape && widget.action != null)
                    TextButton(
                      onPressed: (){}, child: 
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            widget.action == UserActions.Delete_Msg ? const Icon(Icons.delete, color: psBlack1) : const Icon(Icons.edit, color: psBlack1),
                            const Spacing.smallWidth(),
                            sText(widget.action == UserActions.Delete_Msg ? 'Delete' : 'Edit', size: 17),
                        ],
                      ), 
                    ),
                    if(isLandscape && widget.action != null)
                    const Spacing.smallWidth(),
                    if(isLandscape && widget.action != null)
                    TextButton(
                      onPressed: () => widget.cancel(null), 
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            const Icon(Icons.cancel, color: psBlack1),
                            const Spacing.smallWidth(),
                            sText('Cancel', size: 17),
                        ],
                      ), 
                    ),
                    if(!isLandscape)
                    const Spacing.meduimWidth(),
                    if(isLandscape)
                    const Spacing.largeWidth(),
                    if(Platform.isIOS && isLandscape)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => widget.openModal,
                          child: Icon(CupertinoIcons.add),
                        ),
                      ],
                    ),
                    if(Platform.isIOS && isLandscape)
                    const Spacing.smallWidth(),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.search),),
                  ],
                ),
              ],
            ),
          ),
          const Spacing.tinyHeight(),
        ],
      ),
    );
  }
}