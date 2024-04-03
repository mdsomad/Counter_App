import 'package:hive/hive.dart';
import 'package:tsv_count_app/models/notes_model.dart';




class Boxes {


  static Box<NotesModel> getData() => Hive.box<NotesModel>("notes");
  
  
}