import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/widget/card/base_card.dart';
import 'package:flutter_youtube/widget/card_footer_widget.dart';
import 'package:flutter_youtube/widget/cover_widget.dart';
import 'package:flutter_youtube/widget/install_button_widget.dart';
import 'package:flutter_youtube/widget/star_and_tag_widget.dart';

class CardADGame2 extends BaseCardItemWidget {

  CardADGame2(FeedItem cardItem) : super(cardItem);


  @override
  Widget initWidget(BuildContext context) {

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Container(
              child: CoverWidget(feedItem.cover,),
            ),

            Container(
              height: SizeConstants.INSTALL_BUTTON_HEIGHT,
              child: InstallButtonWidget("安装", hasRadius: false,),
            ),

            Container(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: CardFooterWidget(null, feedItem.title, feedItem.desc, menuList: TextConstants.menuListForAD),
            ),

            Container(
              child: StarAndTagWidget(feedItem.category, feedItem.tag, feedItem.star),
            ),

          ],
        ),
      ),
      onTap: (){

      },
    );
  }
}
