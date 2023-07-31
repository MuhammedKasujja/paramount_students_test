import 'package:paramount_students/ui/chat/view_model/chat_view_model.dart';

class Institution extends ChatViewModel {
  bool isFavorite;
  bool isOnline;
  bool isSelected;

  String? name;
  Institution(
      {this.name,
      this.isFavorite = false,
      this.isOnline = false,
      this.isSelected = false});
  // static List<String> search(String? query) {
  //   List<String> searchPeople({String? query, String? filter}) {
  //     return _sampleData
  //         .where(
  //             (element) => element.fullName.toLowerCase().contains(query ?? ''))
  //         .where(
  //             (element) => filter == null || element.status == filter)
  //         .toList();
  //   }
  // }

  factory Institution.fromMap(Map<dynamic, dynamic> data) => Institution(
        isFavorite: data['isFavorite'] as bool,
        isOnline: data['isOnline'] as bool,
        isSelected: data['isSelected'] as bool,
        name: data['name'] as String?,
      );

  Institution copyWith(
      {bool isFavorite = false,
      bool isOnline = false,
      bool isSelected = false,
      String? name}) {
    return Institution(
      isFavorite: isFavorite,
      isOnline: isOnline,
      isSelected: isSelected,
      name: name ?? this.name,
    );
  }

  Map<dynamic, dynamic> toMap() => {
        "name": name,
        "isOnline": isOnline,
        "isFavorite": isFavorite,
        "isSelected": isSelected
      };

  @override
  void toggleFavorites() {
    isFavorite = !isFavorite;
    super.toggleFavorites();
  }

  @override
  void toggleOnlineStatus() {
    isOnline = !isOnline;
    super.toggleOnlineStatus();
  }

  @override
  void toggleSelected() {
    isSelected = !isSelected;
    super.toggleSelected();
  }
}
