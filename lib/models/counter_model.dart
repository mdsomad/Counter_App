import 'package:hive/hive.dart';
part "counter_model.g.dart";

@HiveType(typeId: 0)
class CounterModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  bool isPinned;

  @HiveField(2)
  int counter_value;

  @HiveField(3)
  int counter_range_value;

  @HiveField(4)
  String title;

  @HiveField(5)
  String description;

  @HiveField(6)
  bool isEdited_now;

  @HiveField(7)
  DateTime dateadded;
  CounterModel({
    required this.id,
    required this.isPinned,
    required this.counter_value,
    required this.counter_range_value,
    required this.title,
    required this.description,
    required this.isEdited_now,
    required this.dateadded,
  });
}
