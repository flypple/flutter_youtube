import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/page/base_loading_page.dart';
import 'package:flutter_youtube/provider/base_loading_provider.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/provider/video_detail_provider.dart';
import 'package:flutter_youtube/provider/video_player_provider.dart';
import 'package:flutter_youtube/utils/text_utils.dart';
import 'package:flutter_youtube/widget/card/card_creator.dart';
import 'package:flutter_youtube/widget/card_grid_widget.dart';
import 'package:flutter_youtube/widget/video_detail_header_widget.dart';

class VideoDetailPage extends BaseLoadingPage {
  @override
  BaseLoadingProvider getProvider(BuildContext context) {

    return ProviderStore.of<VideoDetailProvider>(context);
  }

  @override
  List<Widget> getWidgetList(BuildContext context) {
    var provider = getProvider(context) as VideoDetailProvider;
    var videoProvider = ProviderStore.of<VideoPlayerProvider>(context);
    var list = provider.itemList.map((item) => CardCreator.getCard(item)).toList();
    var currentFeedItem = videoProvider.currentFeedItem;
//    list.insert(0, CardGridWidget());
    list.insert(0, getAutoPlaySwitchWidget());
    list.insert(0, VideoDetailHeaderWidget(
      currentFeedItem.title,
      TextUtils.getGroupDesc(currentFeedItem),
      currentFeedItem.icon,
      currentFeedItem.author,
      currentFeedItem.desc,
    ));
    return list;
  }

  Widget getAutoPlaySwitchWidget() {
    return Container(
      margin: EdgeInsets.only(left: 12, bottom: 8),
      height: 24,
      child: Text("接下来播放", style: TextStyle(color: ColorConstants.YOUTUBE_GRAY, fontSize: 16),),
    );
  }


  @override
  bool hasLoadedData(BuildContext context) {
    var provider = getProvider(context) as VideoDetailProvider;
    return provider.itemList.isNotEmpty;
  }

  @override
  void loadData(BuildContext context) {

    getProvider(context).loadData();
  }

  @override
  void loadMore(BuildContext context) {

    getProvider(context).loadData();
  }

  @override
  void refreshData(BuildContext context) {

    getProvider(context).loadData();
  }
}
