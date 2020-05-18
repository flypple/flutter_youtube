import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/widget/card/base_card.dart';
import 'package:flutter_youtube/widget/card_footer_widget.dart';
import 'package:flutter_youtube/widget/cover_widget.dart';
import 'package:flutter_youtube/widget/install_button_widget.dart';
import 'package:flutter_youtube/widget/star_and_tag_widget.dart';

class CardADApp extends BaseCardItemWidget {

  CardADApp(FeedItem cardItem) : super(cardItem);


  @override
  Widget initWidget(BuildContext context) {

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(24, 24, 18, 24),
        child: Row(
          children: <Widget>[
            Container(
              width: 150,
              child: CoverWidget(feedItem.cover, aspectRatio: 1,),
            ),
            Expanded(
             flex: 1,
              child: Container(
                height: 160,
                margin: EdgeInsets.only(left: 12),
                child: Column(
                  children: <Widget>[

                    Container(
                      child: CardFooterWidget(null, feedItem.title, feedItem.desc, menuList: TextConstants.menuListForAD,),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: StarAndTagWidget(feedItem.category, feedItem.tag, feedItem.star),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 16),
                      height: SizeConstants.INSTALL_BUTTON_HEIGHT,
                      child: InstallButtonWidget("下载", mainAxisAlignment: MainAxisAlignment.spaceAround,),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: (){

      },
    );
  }
}
