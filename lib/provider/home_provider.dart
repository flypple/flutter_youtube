import 'dart:io';

import 'package:flutter_youtube/http/http_utils.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/provider/feed_provider.dart';

class HomeProvider extends FeedProvider {
  @override
  Future<List<FeedItem>> requestFromAssets() {
    return HttpUtils.getHomeData("assets/json/youtube.json");
  }

}