import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/model/http_result.dart';

class HttpUtils {
  static Future<List<FeedItem>> getHomeData(String file) async {
    String loadString = await rootBundle.loadString(file);
    var jsonMap = json.decode(loadString);
    List<FeedItem> list = [];
    if (HttpResult.fromJson(jsonMap).state == 0) {
      var feedList = (jsonMap["data"] as List).map(
              (item) => FeedItem.fromJson(item)
      );
      list.addAll(feedList);
    }
    return list;
  }
}