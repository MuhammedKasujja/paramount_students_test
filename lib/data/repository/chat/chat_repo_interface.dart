import 'package:either_dart/either.dart';
import 'package:paramount_students/data/requests/auth/document_upload_form.dart';
import 'package:paramount_students/data/requests/chat/chat_form.dart';
import 'package:paramount_students/data/response/chat/chat_view_res.dart';

abstract class ChatRepoIntl {
  Future<Either<ChatRes, ChatRes>> getChats(dynamic chatCode);
  Future<Either<ChatRes, ChatRes>> sendChat(ChatFormModel chatFormModel);
  Future<Either<ChatRes, ChatRes>> getContactList();
  Future<Either<ChatRes, ChatRes>> uploadDocumentForm(
      DocumentUploadFormModel documentUploadFormModel);
}
