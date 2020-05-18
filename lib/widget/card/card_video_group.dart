import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/utils/text_utils.dart';
import 'package:flutter_youtube/widget/card/card_video.dart';

import 'base_card.dart';

class CardVideoGroup extends BaseCardItemWidget {

  int maxTitleLines;
  double titleSize;
  int maxSubTitleLines;
  double subTitleSize;
  String groupTitle;
  List<String> menuList;

  CardVideoGroup(FeedItem feedItem, {
    this.maxTitleLines,
    this.titleSize,
    this.maxSubTitleLines,
    this.subTitleSize,
    this.groupTitle,
    this.menuList,
  }) : super(feedItem);


  @override
  Widget initWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, bottom: 12),
              child: Text(groupTitle ?? feedItem.title, style: TextStyle(color: ColorConstants.YOUTUBE_BLACK, fontSize: SizeConstants.CARD_BIG_TITLE_SIZE),),
            ),

            Container(
              padding: EdgeInsets.only(top: 6,),
              child: getHorizontalVideoScrollView(),
            ),
          ],
        ),
      ),
      onTap: (){

      },
    );
  }

  Widget getHorizontalVideoScrollView() {
    return Container(

      child: SingleChildScrollView(
        child: Wrap(
          children: feedItem.feedList.map((item) {
            return Container(
              width: 140,
              margin: EdgeInsets.only(left: 16),
              child: CardVideo(
                item,
                hideIcon: true,
                hasBorder: false,
                titleSize: titleSize,
                maxTitleLines: maxTitleLines,
                subTitleSize: subTitleSize,
                maxSubTitleLines: maxSubTitleLines,
                menuList: menuList,
              ),
            );
          }).toList(),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}