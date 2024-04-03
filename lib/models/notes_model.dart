import 'package:hive/hive.dart';
part  "notes_model.g.dart";





@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  
  @HiveField(0)
  int counter;
 
  @HiveField(1)
  String description;

  @HiveField(2)
  bool selected;

  NotesModel({required this.counter, required this.description,required this.selected});
  
}