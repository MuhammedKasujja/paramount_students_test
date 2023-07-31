import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:paramount_students/app_utils/widgets/app_loader.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/data/repository/services/PusherWebSockets/pusher.dart';
import 'package:paramount_students/ui/base/base_view.dart';
import 'package:paramount_students/ui/chat/view_model/chat_view_model.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';
import 'package:paramount_students/models/store.dart';
import 'package:provider/provider.dart';
import 'package:paramount_students/app_utils/widgets/spacing.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/ui/chat/service/modals.dart';
import '../unicode_constants.dart';

class NewMessage extends StatefulWidget {
  final String? userType;
  final String? senderName;
  final String? senderPictureUrl;
  final int? receiverId;
  final int? senderId;
  final bool? isMe;
  final dynamic chatCode;
  final FocusNode newMsgFocusNode;
  NewMessage({
    this.receiverId, 
    this.userType, 
    this.senderId, 
    this.isMe,
    this.chatCode,
    required this.newMsgFocusNode,
    this.senderName,
    this.senderPictureUrl});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final ChatViewModel model = ChatViewModel();
  final Modals modals = Modals();
  List<dynamic> savedChats = [];
  List<dynamic> chats = [];
  late Store channelsStore;
  //message variable to store submitted message
  String? msg;
  final _formKey = GlobalKey<FormState>();
  var textContainer = '';
  var onBold = false;
  var onItalic = false;
  var onStrikeThru = false;
  var onBulletList = false;
  var onFocus = false;
  var onNumberedList = false;
  var numberedListCounter = 0;
  var bulletListCounter = 0;
  var index = -1;

  void _submit() async {
    _formKey.currentState!.save();
    Map<String, dynamic> chatFormData = {
      'message': model.attachmentUrls.isEmpty ? msg : '$msg<br>${model.attachmentUrls}',
      'receiver_id': widget.receiverId,
      'chat_code': widget.chatCode,
      'receiver_type': widget.userType
    };

    await model.sendChatRequest(chatFormData);
    setState(() {});
    
  }

  void _clearList() {
    setState(() {
      model.textController.clear();
      model.attachmentUrls = '';
      numberedListCounter = 0;
      bulletListCounter = 0;
      onNumberedList = false;
      onBulletList = false;
    });
  }

  void _handleTextChange() {
    Provider.of<Store>(context, listen: false).channel.trigger('typing');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.textController.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    model.textController.removeListener(_handleTextChange);
    model.close();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final navigator = Navigator.of(context);
    final chatsStore = Provider.of<Store>(context);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      height: isLandscape
          ? MediaQuery.of(context!).size.height * .38
          : MediaQuery.of(context!).size.height * .22,

      decoration: BoxDecoration(color: psGrey1),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * .825,
              height: isLandscape ? MediaQuery.of(context).size.height * .35 : MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(color: psWhite),
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 1),
              margin: EdgeInsets.only(top: 5, bottom: isLandscape ? 0 : 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onBold = !onBold;
                            });
                          },
                          child: Icon(
                            CupertinoIcons.bold,
                            size: 18,
                          ),
                        ),
                        const Spacing.smallWidth(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onItalic = !onItalic;
                            });
                          },
                          child: Icon(
                            CupertinoIcons.italic,
                            size: 18,
                          ),
                        ),
                        const Spacing.smallWidth(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onStrikeThru = !onStrikeThru;
                            });
                          },
                          child: Icon(
                            CupertinoIcons.strikethrough,
                            size: 18,
                          ),
                        ),
                        const Spacing.smallWidth(),
                        const VerticalDivider(
                            thickness: 1, color: appBlackText),
                        const Spacing.smallWidth(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //initializing bullet list
                              onBulletList = !onBulletList;
                              //clearing list
                              if (onBulletList == false) {
                                _clearList();
                                return;
                              }
                              //resetting numbered list
                              if (onNumberedList == true)
                                onNumberedList = !onNumberedList;
                              //resetting controller text
                              if( model!.textController.text.isEmpty){
                                  //resetting counters
                                  bulletListCounter = 0;
                                  numberedListCounter = 0;
                                model.textController.text = "\u2B24 ";
                                model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                              }
                              if(model.textController.text.isNotEmpty){
                                if(!model.textController.text.contains('\u2B24') && !model.textController.text.contains('${Unicodes.codes[numberedListCounter]}.') && !model.textController.text.contains('\n')){
                                    model.textController.text = '\u2B24 ${model.textController.text}';
                                    model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                                }else if(!model.textController.text.contains('\u2B24') && !model.textController.text.contains('${Unicodes.codes[numberedListCounter]}.')){
                                    final textArr = model.textController.text.split('\n');
                                    final updatedTextArr = textArr.map((element) {
                                        return '\u2B24 $element';
                                     });
                                    model.textController.text = updatedTextArr.join('\n');
                                    model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                                }else{
                                  // model.textController.text = model.textController.text.replaceFirst(RegExp('${Unicodes.codes[numberedListCounter]}.'), '\u2B24', numberedListCounter);
                                  final textArr = model.textController.text.split('\n');
                                    final updatedTextArr = textArr.map((element) {
                                      if(element.contains(Unicodes.codes[numberedListCounter]) && onBulletList){
                                        return element.replaceFirst('${Unicodes.codes[numberedListCounter]}.', '\u2B24');
                                      }
                                      return element;
                                     });
                                    model.textController.text = updatedTextArr.join('\n');
                                  model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                                }
                              }
                            });
                          },
                          child: Icon(
                            CupertinoIcons.list_bullet,
                            size: 18,
                          ),
                        ),
                        const Spacing.smallWidth(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //initializing numbered list
                              onNumberedList = !onNumberedList;
                              //clearing list
                              if (onNumberedList == false) {
                                _clearList();
                                return;
                              }
                              //resetting bullet list
                              if (onBulletList == true)
                                onBulletList = !onBulletList;
                              //resetting controller text
                              if(model!.textController.text.isEmpty){
                                //resetting counters
                                bulletListCounter = 0;
                                numberedListCounter = 0;
                                model.textController.text = '${Unicodes.codes[numberedListCounter]}. ';
                                model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                              }
                              if(model.textController.text.isNotEmpty){
                                if(!model.textController.text.contains('\u2B24') && !model.textController.text.contains('${Unicodes.codes[numberedListCounter]}.') && !model.textController.text.contains('\n')){
                                    model.textController.text = '${Unicodes.codes[numberedListCounter]}. ${model.textController.text}';
                                    model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                                }else if(!model.textController.text.contains('\u2B24') && !model.textController.text.contains('${Unicodes.codes[numberedListCounter]}.') ){
                                    final textArr = model.textController.text.split('\n');
                                    final updatedTextArr = textArr.map((element) {
                                      index++;
                                      numberedListCounter = index;
                                      return '${Unicodes.codes[index]}. $element';
                                        
                                     });
                                     //resetting index 
                                     index = -1;
                                    model.textController.text = updatedTextArr.join('\n');
                                    model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                                }else{
                                  // model.textController.text = model.textController.text.replaceFirst(Unicodes.dots[bulletListCounter], '${Unicodes.codes[numberedListCounter]}.', bulletListCounter );
                                  final textArr = model.textController.text.split('\n');
                                  final updatedTextArr = textArr.map((element) {
                                    if (element.contains(
                                            Unicodes.dots[bulletListCounter]) &&
                                        onNumberedList) {
                                      return element.replaceFirst(
                                          Unicodes.dots[bulletListCounter],
                                          '${Unicodes.codes[numberedListCounter]}.');
                                    }
                                    return element;
                                    });
                                  model.textController.text = updatedTextArr.join('\n');
                                  model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                                }
                              }
                            });
                          }, 
                          child: Icon(CupertinoIcons.list_number, size: 18,),
                        ),
                        const Spacing.smallWidth(),
                        GestureDetector(
                          onTap: ()async{
                            await modals.openAttachmentModal(
                              context: context, 
                              navigator: navigator, 
                              store: chatsStore,
                              model: model,
                              );
                          },
                          child: Icon(Icons.attach_file, size: 18, color: psGrey4),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: psGrey3,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 4,
                        child: SizedBox(
                          height: isLandscape
                            ? MediaQuery.of(context).size.height * .2
                            : MediaQuery.of(context).size.height * .13,
                          width: MediaQuery.of(context).size.width * .8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: model.attachmentUrls.isEmpty ? 1 : 3,
                                child: Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.zero,
                                      border: InputBorder.none,                                      
                                      hintText: 'Type Something...', 
                                    ),
                                    maxLines: null,
                                    controller: model.textController,
                                    onTap: () {
                                      if(widget.newMsgFocusNode.hasFocus && MediaQuery.of(context).viewInsets.bottom == 0 && onFocus){
                                        widget.newMsgFocusNode.unfocus();
                                        Future.delayed(const Duration(microseconds: 1,), () => widget.newMsgFocusNode.requestFocus());
                                      }else{
                                        setState(() => onFocus = true);
                                      }
                                    },
                                    onChanged: (s){
                                      setState(() {
                                        if(s.substring(s.length -1) == "\n" && onBulletList ){
                                        bulletListCounter++;
                                        model.textController.text = '${model.textController.text}\u2B24 ';
                                        model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                                        }
                                        if(s.substring(s.length -1) == "\n" && onNumberedList ){
                                          numberedListCounter++;
                                          model.textController.text = '${model.textController.text}${Unicodes.codes[numberedListCounter]}. ';
                                          model.textController.selection = TextSelection.fromPosition(TextPosition(offset: model.textController.text.length));
                                        }
                                        //allowing backspace key press
                                         if (s.substring(s.length -1) == "\b") {
                                          final selectionStart = model.textController.selection.start;
                                          final selectionEnd = model.textController.selection.end;
                                  
                                          model.textController.text = model.textController.text.substring(0, model.textController.text.length - 1);
                                          model.textController.selection = TextSelection(
                                            baseOffset: selectionStart,
                                            extentOffset: selectionEnd,
                                          );
                                         }
                                  
                                      });
                                    },
                                    focusNode: widget.newMsgFocusNode,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      decoration: onStrikeThru ? TextDecoration.lineThrough : TextDecoration.none,
                                      fontWeight: onBold ? FontWeight.bold : FontWeight.normal,
                                      fontStyle: onItalic ? FontStyle.italic : FontStyle.normal,
                                      
                                    ),
                                    textInputAction: TextInputAction.newline,
                                    keyboardType: TextInputType.multiline,
                                    onSaved: (val){
                                      msg = val;
                                    },
                                  ),
                                
                                ),
                              ),
                              if(model.attachmentUrls.isNotEmpty)
                              Expanded(
                                flex: 2,
                                child: SingleChildScrollView(
                                  child: Html(
                                    data: model.attachmentUrls, 
                                    style: {
                                      '*': Style(
                                        maxLines: null,
                                        margin: Margins.only(left: 0)
                                      )
                                    }
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacing.smallWidth(),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: onFocus ? () {
                            _submit();
                            model.textController.clear();
                            model.attachmentUrls = '';
                            widget.newMsgFocusNode.unfocus();
                            setState(() => onFocus = !onFocus);
                          } : null,

                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            fixedSize: const Size(30, 10),
                            backgroundColor: onFocus ? Colors.amber : model.isLoading ? Colors.amber : psGrey5,
                          ),

                          child: model.isLoading ? const AppLoader(color: appBlackText) : sText("Send", size: 12),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
