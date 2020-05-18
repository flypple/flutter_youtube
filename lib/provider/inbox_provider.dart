import 'package:flutter/cupertino.dart';

class InboxProvider with ChangeNotifier{
  bool loadSuccess = true;

  void reversalStatus() {
    loadSuccess = !loadSuccess;
    notifyListeners();
  }
}