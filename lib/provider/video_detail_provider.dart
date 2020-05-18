import 'package:flutter_youtube/http/http_utils.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/provider/feed_provider.dart';

class VideoDetailProvider extends FeedProvider {

  @override
  Future<List<FeedItem>> requestFromAssets() {

    return HttpUtils.getHomeData("assets/json/youtube3.json");
  }

  @override
  bool canLoadMore() {

    return false;
  }

  @override
  bool canRefresh() {

    return false;
  }
}