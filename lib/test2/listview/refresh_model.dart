import 'package:flutter/material.dart';

class RefreshModel extends ChangeNotifier {
  bool shouldRefresh = false;

  set refresh(bool value) {
    shouldRefresh = value;
    notifyListeners();
  }

  bool get refresh {
    return shouldRefresh;
  }
}
