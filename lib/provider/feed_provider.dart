import 'dart:io';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/http/http_utils.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/provider/base_loading_provider.dart';

abstract class FeedProvider extends BaseLoadingProvider {

  List<FeedItem> _itemList = [];

  List<FeedItem> get itemList => _itemList;

  @override
  void addFeedData({data}) {
    if (data == null || !(data is List<FeedItem>)) {
      onNothingMore();
      return;
    }

    var list = data as List<FeedItem>;
    if (list.isNotEmpty) {
      onSuccess();
      _itemList.addAll(list);
    } else {
      onNothingMore();
    }
    notifyListeners();
  }

  @override
  void setFeedData({data}) {
    if (data == null || !(data is List<FeedItem>)) {
      onError();
      return;
    }

    var list = data as List<FeedItem>;

    if (list.isNotEmpty) {
      onSuccess();
      clearData();
      _itemList.addAll(list);
    } else {
      onError();
    }
    notifyListeners();
  }

  @override
  void clearData() {
    _itemList.clear();
  }

  @override
  void loadData() async {
    print("loadData1======== ${DateTime.now().toString()}");
    TimerUtil(mTotalTime: 1500)
      ..setOnTimerTickCallback((time) async {
        if (time == 0) {
          print("loadData2========${DateTime.now().toString()}");
          var list = await requestFromAssets();
          setFeedData(data: list);
        }
      })
      ..startCountDown();

  }

  @override
  void loadMoreData() async {
    onLoadingMore();
    var list = await requestFromAssets();
    addFeedData(data: list);
  }

  @override
  void refreshData() async {
    var list = await requestFromAssets();
    setFeedData(data: list);
  }

  @override
  bool canLoadMore() {
    return true;
  }

  @override
  bool canRefresh() {

    return true;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  @protected
  Future<List<FeedItem>> requestFromAssets();

  FeedProvider() {

    print("FeedProvider() ==>  ${hashCode}");
  }
}