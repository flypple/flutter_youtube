import 'package:flutter/material.dart';

abstract class BaseLoadingProvider with ChangeNotifier {
  bool needFirsLoadData = true;

  bool error = false;

  bool isLoading = true;

  bool isNothingMore = false;

  bool isLoadingMore = false;

  void onLoading() {
    isLoading = true;
    error = false;
    isNothingMore = false;
    isLoadingMore = false;

    clearData();

//    notifyListeners();
  }

  void onError() {
    isLoading = false;
    error = true;
    isNothingMore = false;
    isLoadingMore = false;

    clearData();

//    notifyListeners();
  }

  void onNothingMore() {
    isLoading = false;
    error = false;
    isNothingMore = true;
    isLoadingMore = false;

    notifyListeners();
  }

  void onLoadingMore() {
    isLoading = false;
    error = false;
    isNothingMore = false;
    isLoadingMore = true;

//    notifyListeners();
  }

  void onSuccess() {
    isLoading = false;
    error = false;
    isNothingMore = false;
    isLoadingMore = false;

//    notifyListeners();
  }

  void setFeedData({data});

  void addFeedData({data});

  void clearData();

  void loadData();

  void loadMoreData();

  void refreshData();

  bool canLoadMore();

  bool canRefresh();
}