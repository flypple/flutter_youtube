import 'package:flutter/material.dart';

class IndexProvider with ChangeNotifier {

  int _index;
  int get index => _index;

  IndexProvider(this._index){

    print("IndexProvider() ==>  ${hashCode}");

  }

  changeIdnex(index){
    this._index = index;
    notifyListeners();
  }

}