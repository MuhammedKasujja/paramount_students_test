import 'package:hive/hive.dart';
part 'short_list_model.g.dart';

@HiveType(typeId: 0)
class ShortListModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String dept;

  @HiveField(2)
  final String university;

  @HiveField(3)
  final String univeristyLocation;

  @HiveField(4)
  final int amount;

  @HiveField(5)
  final String date;

  @HiveField(6)
  final String programId;

  ShortListModel({
    required this.id,
    required this.dept,
    required this.university,
    required this.univeristyLocation,
    required this.amount,
    required this.date,
    required this.programId,
  });
}
