import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  get selectedMenuOtp => _selectedMenuOpt;

  set selectedMenuOtp(index) {
    _selectedMenuOpt = index;
    notifyListeners();
  }
}
