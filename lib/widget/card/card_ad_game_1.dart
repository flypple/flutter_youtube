import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/widget/card/base_card.dart';
import 'package:flutter_youtube/widget/card_footer_widget.dart';
import 'package:flutter_youtube/widget/cover_widget.dart';
import 'package:flutter_youtube/widget/install_button_widget.dart';
import 'package:flutter_youtube/widget/star_and_tag_widget.dart';

class CardADGame1 extends BaseCardItemWidget {

  CardADGame1(FeedItem cardItem) : super(cardItem);


  @override
  Widget initWidget(BuildContext context) {

    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: CoverWidget(feedItem.cover,),
            ),

            Container(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: CardFooterWidget(feedItem.icon, feedItem.title, feedItem.desc, menuList: TextConstants.menuListForAD),
            ),

            Container(
              margin: EdgeInsets.only(left: 70),
              child: StarAndTagWidget(feedItem.category, feedItem.tag, feedItem.star),
            ),

            Container(
              height: SizeConstants.INSTALL_BUTTON_HEIGHT,
              margin: EdgeInsets.all(14),
              child: InstallButtonWidget("安装"),
            )
          ],
        ),
      ),
      onTap: (){

      },
    );
  }
}
