import 'package:hive/hive.dart';
import 'package:paramount_students/app_utils/helper/helper.dart';
import 'package:paramount_students/data/repository/shortList/short_list_repo.dart';
import 'package:paramount_students/ui/base/base_view_model.dart';
import 'package:paramount_students/ui/shortlist/models/short_list_model.dart';

class ShortListViewModel extends BaseViewModel {
  List<ShortListModel> shortlist = [];
  late Box _box;
  late ShortListRepo _shortListRepo;
  // used to prevent accessing the Box before initialization [isShortListItem]
  bool isBoxInitialized = false;

  @override
  void close() {}

  @override
  void init() async {
    _shortListRepo = ShortListRepo();
    _box = await _shortListRepo.openBox();
    isBoxInitialized = true;
    getShortList();
  }

  Future getShortList() async {
    shortlist = _shortListRepo.getShortList(_box);
    notifyListeners();
  }

  Future addToShortList(ShortListModel shortListModel) async {
    if (isShortListItem(shortListModel.programId)) {
      _removeFromShortListData(shortListModel);
    } else {
      _addToShortListData(shortListModel);
    }
    getShortList();
  }

  Future removeAll() async {
    await _shortListRepo.clearShortList(_box);
    notifyListeners();
  }

  Future _addToShortListData(ShortListModel shortListModel) async {
    await _shortListRepo.addProgramToShortList(_box, shortListModel);
    toastMessage('Added to Shortlist');
    notifyListeners();
  }

  Future _removeFromShortListData(ShortListModel shortListModel) async {
    await _shortListRepo.removeProgramFromShortList(_box, shortListModel);
    toastMessage('Remove from Shortlist');
    notifyListeners();
  }

  bool isShortListItem(String key) {
    if (!isBoxInitialized) {
      return false;
    }
    final shortListModel = _shortListRepo.getShortListItemByKey(_box, key);
    return shortListModel != null;
  }
}
