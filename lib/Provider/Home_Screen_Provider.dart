import 'package:flutter/material.dart';

class HomeScreenProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void clearCounter() {
    _counter = 0;
    notifyListeners();
  }
  void setCounter(int value) {
    _counter = value;
    notifyListeners();
  }
}
