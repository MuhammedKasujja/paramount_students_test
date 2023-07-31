import 'package:hive/hive.dart';
import 'package:paramount_students/ui/shortlist/models/short_list_model.dart';

abstract class ShortListRepoInterface {
  Future<Box> openBox();
  List<ShortListModel> getShortList(Box box);
  ShortListModel? getShortListItemByKey(Box box, String key);
  Future<void> addProgramToShortList(Box box, ShortListModel shortListModel);
  Future<void> removeProgramFromShortList(Box box, ShortListModel shortListModel);
  Future<void> clearShortList(Box box);
}
