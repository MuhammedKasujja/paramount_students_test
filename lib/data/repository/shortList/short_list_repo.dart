import 'package:hive/hive.dart';
import 'package:paramount_students/data/local_database.dart/hive_keys.dart';
import 'package:paramount_students/ui/shortlist/models/short_list_model.dart';
import 'short_list_interface.dart';

class ShortListRepo implements ShortListRepoInterface {
  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<ShortListModel>(HiveKeys.shortListProgrmsBox);
    return box;
  }

  @override
  List<ShortListModel> getShortList(Box box) {
    return box.values.toList() as List<ShortListModel>;
  }

  @override
  ShortListModel? getShortListItemByKey(Box box, String key) {
    return  box.get(key) as ShortListModel?;
  }

  @override
  Future<void> addProgramToShortList(
      Box box, ShortListModel shortListModel) async {
    await box.put(shortListModel.programId, shortListModel);
  }

  @override
  Future<void> removeProgramFromShortList(
      Box box, ShortListModel shortListModel) async {
    await box.delete(shortListModel.programId);
  }

  @override
  Future<void> clearShortList(Box box) async {
    await box.clear();
  }
}
