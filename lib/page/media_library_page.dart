import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/provider/media_library_provider.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/widget/card/card_video_group.dart';

class MediaLibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: initWidget(context),
    );
  }

  Widget initWidget(context) {
    var provider = ProviderStore.of<MediaLibraryProvider>(context);
    return SingleChildScrollView(
      child: Container(
        color: ColorConstants.YOUTUBE_WHITE,
        child: Column(
          children: <Widget>[
            CardVideoGroup(
              provider.historyData,
              titleSize: 15,
              subTitleSize: 12,
              maxSubTitleLines: 1,
              menuList: TextConstants.menuListForHistory,
            ),
            getTileWidget(context,
              icon: Icons.history,
              title: "历史记录",
            ),
            getTileWidget(context,
              icon: Icons.play_circle_outline,
              title: "您的视频",
            ),
            getTileWidget(context,
              icon: Icons.loyalty,
              title: "购买的内容",
            ),
            getTileWidget(context,
              icon: Icons.timelapse,
              title: "历史记录",
              subTitle: "1个视频",
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(border: Border(top: BorderSide(width: 0.5, color: Colors.black26),),),
            ),
            getPlayerListWidget(),
            Container(
              height: 100,
              color: ColorConstants.YOUTUBE_WHITE,
            )
          ],
        ),
      ),
    );
  }

  Widget getTileWidget(context, {icon, title, subTitle}) {
    return Container(
      height: 52,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 24),
            width: 52,
            child: Icon(icon, color: ColorConstants.YOUTUBE_GRAY,),
          ),
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(title, style: TextStyle(fontSize: SizeConstants.CARD_TITLE_SIZE),),
                ),
                subTitle != null
                    ? Container(child: Text(subTitle, style: TextStyle(color: ColorConstants.YOUTUBE_GRAY, fontSize: SizeConstants.CARD_SUB_TITLE_SIZE),) ,)
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getPlayerListWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: <Widget>[
          Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text("播放列表", style: TextStyle(fontSize: SizeConstants.CARD_TITLE_SIZE),),
                ),
                Container(
                  child: PopupMenuButton(
                    itemBuilder: (context) {
                      return TextConstants.menuListForLast.map((item) {
                        return PopupMenuItem(value: item, child: Text(item),);
                      }).toList();
                    },
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text("最新添加", style: TextStyle(color: ColorConstants.YOUTUBE_GRAY_2),),
                          ),
                          Container(
                            child: Icon(Icons.arrow_drop_down, color: ColorConstants.YOUTUBE_GRAY_2,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 52,
            margin: EdgeInsets.only(bottom: 12),
            child: Row(
              children: <Widget>[
                Container(
                  width: 52,
                  child: Icon(Icons.add, color: ColorConstants.YOUTUBE_BLUE, size: 48,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, bottom: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text("新建播放列表",
                          style: TextStyle(color: ColorConstants.YOUTUBE_BLUE, fontSize: SizeConstants.CARD_TITLE_SIZE),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 52,
            margin: EdgeInsets.only(bottom: 12),
            child: Row(
              children: <Widget>[
                Container(
                  width: 48,
                  height: 48,
                  color: ColorConstants.YOUTUBE_GRAY_2,
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, bottom: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text("顶过的视频", style: TextStyle(fontSize: SizeConstants.CARD_TITLE_SIZE),),
                      ),
                      Container(
                        child: Text(
                          "无视频",
                          style: TextStyle(
                              color: ColorConstants.YOUTUBE_GRAY,
                              fontSize: SizeConstants.CARD_SUB_TITLE_SIZE
                          ),
                        ),
                      ),
                    ],
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
