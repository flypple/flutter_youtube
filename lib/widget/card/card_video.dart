import 'package:flutter/material.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/page/video_detail_page.dart';
import 'package:flutter_youtube/page/video_player_page.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/provider/video_player_provider.dart';
import 'package:flutter_youtube/utils/status_bar_utils.dart';
import 'package:flutter_youtube/utils/text_utils.dart';
import 'package:flutter_youtube/widget/card/base_card.dart';

import '../../constants.dart';
import '../card_footer_widget.dart';
import '../cover_widget.dart';

class CardVideo extends BaseCardItemWidget {

  bool hideIcon;
  int maxTitleLines;
  double titleSize;
  int maxSubTitleLines;
  double subTitleSize;
  List<String> menuList;

  CardVideo(FeedItem feedItem, {
    this.hideIcon = false,
    this.maxTitleLines,
    this.titleSize,
    this.maxSubTitleLines,
    this.subTitleSize,
    this.menuList,
    bool hasBorder = true,
  }) : super(feedItem, hasBorder: hasBorder);


  @override
  Widget initWidget(BuildContext context) {
    String groupDesc = TextUtils.getGroupDesc(feedItem);
    String iconUrl = hideIcon ? null : feedItem.icon;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Column(
          children: <Widget>[
            Container(
              child: CoverWidget(feedItem.cover, duration: feedItem.duration,),
            ),

            Container(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: CardFooterWidget(
                iconUrl,
                feedItem.title,
                groupDesc,
                menuList: menuList ?? TextConstants.menuListForVideo,
                titleSize: titleSize,
                maxTitleLines: maxTitleLines,
                subTitleSize: subTitleSize,
                maxSubTitleLines: maxSubTitleLines,
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        var playerProvider = ProviderStore.of<VideoPlayerProvider>(context);
        print("CardVideo2：$context");
        print("当前的播放器：$playerProvider");
        if (playerProvider != null && playerProvider.chewieController != null) {
          playerProvider.chewieController.pause();
        }
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProviderStore.initVideoDetailPage(VideoPlayerPage(), feedItem),
        )).then((value){
          StatusBarUtils.setWhiteStatusBarColor();
          if (playerProvider != null && playerProvider.chewieController != null) {
            playerProvider.chewieController.play();
          }
//          ProviderStore.of<VideoPlayerProvider>(context).currentFeedItem = feedItem;
        });
      },
    );
  }
}
