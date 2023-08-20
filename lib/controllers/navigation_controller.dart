import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {

  String screenName = '/home';
  List<String> screens = ['/home', '/shop'];
  int currentIndex = 0;

  void changeScreen(int index) {
    currentIndex = index;
    screenName = screens[index];
    notifyListeners();
  }

}