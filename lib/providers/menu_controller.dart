import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _globalKeys = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _globalKeys;

  void controlMenu() {
    if (!_globalKeys.currentState!.isDrawerOpen) {
      _globalKeys.currentState!.openDrawer();
    }
  }
}
