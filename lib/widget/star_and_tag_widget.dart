import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/widget/static_rating_bar.dart';

class StarAndTagWidget extends StatelessWidget {
  String category;
  String tag;
  double star;

  StarAndTagWidget(this.category, this.tag, this.star);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            height: 22,
            width: 36,
            alignment: Alignment.center,
            child: Text(
              category,
              style: TextStyle(
                height: 1.2,
                color: ColorConstants.YOUTUBE_WHITE,
                fontSize: SizeConstants.CARD_TITLE_LITTLE_SIZE,
              ),
            ),
            decoration: BoxDecoration(
              color: ColorConstants.YOUTUBE_YELLOW_2,
              borderRadius: BorderRadius.all(Radius.circular(SizeConstants.IMAGE_RADIU_SIZE_3)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 6),
            child: Text("$star", style: TextStyle(color: ColorConstants.YOUTUBE_GRAY, fontSize: SizeConstants.CARD_SUB_TITLE_SIZE),),
          ),
          Container(
            margin: EdgeInsets.only(left: 6),
            child: StaticRatingBar(
              rate: star,
              colorLight: ColorConstants.YOUTUBE_GRAY,
              colorDark: Colors.black26,
              size: 14,
            ),
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left: 6),
            child: Text(
              tag,
              style: TextStyle(
                color: ColorConstants.YOUTUBE_GRAY,
                fontSize: SizeConstants.CARD_SUB_TITLE_SIZE,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )),
        ],
      ),
    );
  }
}
