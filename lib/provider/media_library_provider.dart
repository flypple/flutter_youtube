import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/model/feed_item.dart';

class MediaLibraryProvider with ChangeNotifier{
  FeedItem historyData;

  MediaLibraryProvider() {
    historyData = FeedItem.fromJson(json.decode(TextConstants.historyString));
    historyData.title = "最近";
  }

  void addHistoryItem(FeedItem feedItem) {

    historyData.feedList.add(feedItem);
    notifyListeners();
  }
}