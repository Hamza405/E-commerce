import 'package:e_c/view/cart_view.dart';
import 'package:e_c/view/home_page.dart';
import 'package:e_c/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomePage();
  Widget get currentScreen =>  _currentScreen;
  int get navigatorValue => _navigatorValue;

  

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;

    switch (selectedValue) {
      case 0:
        _currentScreen = HomePage();
        break;

      case 1:
        _currentScreen = CartView();
        break;

      case 2:
        _currentScreen = ProfileView();
        break;
    }
    update();
  }
}
