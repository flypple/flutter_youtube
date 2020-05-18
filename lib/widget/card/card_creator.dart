import 'package:flutter/material.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/widget/card/card_ad_app.dart';
import 'package:flutter_youtube/widget/card/card_ad_game_1.dart';
import 'package:flutter_youtube/widget/card/card_type.dart';
import 'package:flutter_youtube/widget/card/card_video.dart';
import 'package:flutter_youtube/widget/card/card_video_group.dart';

import '../../constants.dart';
import 'card_ad_game_2.dart';

class CardCreator {

  static Widget getCard(FeedItem feedItem, {bool hasBorder}) {
    Widget widget;
    switch (feedItem.type) {
      case CardType.ITEM_AD_GAME_1:
        widget = CardADGame1(feedItem);
        break;
      case CardType.ITEM_AD_GAME_2:
        widget = CardADGame2(feedItem);
        break;
      case CardType.ITEM_AD_APP:
        widget = CardADApp(feedItem);
        break;
      case CardType.ITEM_VIDEO:
        widget = CardVideo(feedItem);
        break;
      case CardType.ITEM_VIDEO_LIST:
        widget = CardVideoGroup(feedItem);
        break;
    }
    if (widget == null) {
      widget = _getDefaultCard(feedItem);
    }
    return widget;
  }

  static Widget _getDefaultCard(FeedItem feedItem) {
    String text = "数据为空";

    return Container(
      height: 40,
      color: ColorConstants.YOUTUBE_WHITE,
      child: Text(text, maxLines: 1, overflow: TextOverflow.ellipsis,),
      alignment: Alignment.center,
    );
  }
}