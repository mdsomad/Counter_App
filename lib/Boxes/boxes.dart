import 'package:hive/hive.dart';
import 'package:tsv_count_app/models/counter_model.dart';

class Boxes {
  static Box<CounterModel> getData() => Hive.box<CounterModel>("CounterData");
}
