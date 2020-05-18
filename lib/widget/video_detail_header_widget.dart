import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/widget/avatar_widget.dart';

class VideoDetailHeaderWidget extends StatelessWidget {
  String title;

  var subTitle;

  String icon;

  String author;

  String comment;


  VideoDetailHeaderWidget(this.title, this.subTitle, this.icon, this.author, this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getTitleWidget(),
          getSubTitleWidget(),
          getActionGroupWidget(),
          getAuthorWidget(),
          getCommentWidget(),
        ],
      ),
    );
  }

  Widget getTitleWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(18, 4, 18, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Text(title,
                style: TextStyle(fontSize: 18, color: ColorConstants.YOUTUBE_BLACK),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Icon(Icons.arrow_drop_down, size: 34, color: ColorConstants.YOUTUBE_GRAY_2,)
        ],
      ),
    );
  }

  Widget getSubTitleWidget() {
    return Container(

      margin: EdgeInsets.fromLTRB(18, 4, 18, 4),
      child: Text(subTitle, style: TextStyle(color: ColorConstants.YOUTUBE_GRAY_2, fontSize: SizeConstants.CARD_SUB_TITLE_SIZE),),
    );
  }

  Widget getActionGroupWidget() {
    return Container(
      margin: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          getActionItem("assets/images/youtube_like.png", "5411"),
          getActionItem("assets/images/youtube_unlike.png", "68"),
          getActionItem("assets/images/youtube_share.png", "分享"),
          getActionItem("assets/images/youtube_download.png", "下载"),
          getActionItem("assets/images/youtube_save.png", "保存"),
        ],
      ),
    );
  }

  Widget getActionItem(String assetsImage, String label) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Image.asset(assetsImage, height: 28, width: 28,),
          ),
          Container(
            child: Text(label, style: TextStyle(color: ColorConstants.YOUTUBE_GRAY_2, fontSize: SizeConstants.CARD_SUB_TITLE_SIZE),),
          )
        ],
      ),
    );
  }

  Widget getAuthorWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.black26,),
          bottom: BorderSide(width: 0.5, color: Colors.black26,),
        ),
      ),
      child: Row(
        children: <Widget>[

          Container(
            width: 40,
            margin: EdgeInsets.only(left: 2, top: 6, right: 4),
            child: AvatarWidget(icon),
          ),

          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      author,
                      style: TextStyle(
                        fontSize: SizeConstants.CARD_TITLE_SIZE,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: ColorConstants.YOUTUBE_BLACK,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      "60.8万订阅者",
                      style: TextStyle(
                        fontSize: SizeConstants.CARD_SUB_TITLE_SIZE,
                        color: ColorConstants.YOUTUBE_GRAY_2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ),

          Container(
            child: Text(
              "订阅",
              style: TextStyle(
                color: ColorConstants.YOUTUBE_RED,
                fontSize: SizeConstants.CARD_TITLE_SIZE,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCommentWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black26,),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 18,),
                  child: Text(
                    "评论",
                    style: TextStyle(
                      fontSize: SizeConstants.CARD_TITLE_SIZE,
                      color: ColorConstants.YOUTUBE_BLACK,
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 12,),
                    child: Text(
                      "383",
                      style: TextStyle(
                        fontSize: SizeConstants.CARD_TITLE_SIZE,
                        color: ColorConstants.YOUTUBE_GRAY_2,
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 34,
                  width: 34,
                  child: Stack(
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_up, color: Colors.grey, size: 22,),
                      Positioned(
                        bottom: 1,
                        child: Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 22,),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(18, 0, 24, 0),
            child: Row(
              children: <Widget>[

                Container(
                  margin: EdgeInsets.only(left: 2, right: 4),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      color: ColorConstants.YOUTUBE_ORANGE,
                      borderRadius: BorderRadius.all(
                          Radius.circular(16))
                  ),
                  child: Center(
                    child: Text(
                      "q",
                      style: TextStyle(color: ColorConstants.YOUTUBE_WHITE,
                          fontSize: 14,
                          height: 0.6),
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 12, top: 12),
                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Text(
                        comment,
                        style: TextStyle(
                          fontSize: SizeConstants.CARD_SUB_TITLE_SIZE,
                          fontStyle: FontStyle.normal,
                          color: ColorConstants.YOUTUBE_BLACK,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
