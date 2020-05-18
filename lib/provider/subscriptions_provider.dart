import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';

class SubscriptionsProvider with ChangeNotifier{
  bool isOpen = false;
  List<bool> openStatusList;

  List<List<String>> data;

  SubscriptionsProvider() {
    openStatusList = [false, false];
    data = TextConstants.expansionPanelDataList;
  }

  void setOpenState(bool isOpen, int index) {
    openStatusList[index] = isOpen;
    notifyListeners();
  }

  void reversalOpenState(int index) {
    openStatusList[index] = !openStatusList[index];
    notifyListeners();
  }

  List<Item> generateItems(int numberOfItems) {
    return List.generate(numberOfItems, (int index) {
      return Item(
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index',
      );
    });
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}