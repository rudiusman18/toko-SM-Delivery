import 'package:flutter/material.dart';

class BottomTabbarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int newSelectedIndex) {
    _selectedIndex = newSelectedIndex;
    notifyListeners();
  }
}
