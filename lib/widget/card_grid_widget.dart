import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';

class CardGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth, itemWidth, itemHeight, gridViewHeight;
    screenWidth = ScreenUtil.getInstance().screenWidth;
    itemWidth = (screenWidth - 16 * 2 - 12 * 2) / 2;
    itemHeight = itemWidth / 3.6;
    gridViewHeight = (itemHeight) * 5 + 12 * 4 + 9;
    
    return Container(
      color: ColorConstants.YOUTUBE_WHITE_2,
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Container(
        height: gridViewHeight,
        child: GridView.count(

          crossAxisCount: 2,
          childAspectRatio: 3.6,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          physics: NeverScrollableScrollPhysics(),
          children: TextConstants.labelList.map((item){
            return _getGridItem(item);
          }).toList(),
        ),
      ),
    );
  }

  Widget _getGridItem(List item) {
    String label = item[0];
    String url = item[1];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(url),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(SizeConstants.IMAGE_RADIU_SIZE_8)),
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 12),
        child: Text(
          label,
          style: TextStyle(
            color: ColorConstants.YOUTUBE_WHITE,
            fontSize: SizeConstants.CARD_TITLE_SIZE,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
