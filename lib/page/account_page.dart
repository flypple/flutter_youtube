import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              getHeaderWidget(),
              getBodyWidget(),
              Container(
                padding: EdgeInsets.only(top: 12, bottom: 12),
                child: Text("隐私权政策  ·  服务条款", style: TextStyle(color: ColorConstants.YOUTUBE_GRAY),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(48),
      child: AppBar(
        elevation: 2,
        leading: IconButton(
          icon: Icon(Icons.clear, size: 28, color: ColorConstants.YOUTUBE_GRAY,), onPressed: ()=> Navigator.pop(context),
        ),
        title: Text("账号"),
      ),
    );
  }

  Widget getHeaderWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black26))
      ),
      padding: EdgeInsets.fromLTRB(24, 18, 24, 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 3,left: 2, right: 4),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: ColorConstants.YOUTUBE_ORANGE,
                borderRadius: BorderRadius.all(
                    Radius.circular(20))
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

          Container(
            margin: EdgeInsets.only(left: 12,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "qinglin qi",
                        style: TextStyle(
                          fontSize: SizeConstants.CARD_TITLE_SIZE,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 24,
                        color: ColorConstants.YOUTUBE_GRAY,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Text(
                    "flypple20088@gmail.com",
                    style: TextStyle(
                      fontSize: SizeConstants.CARD_TITLE_SIZE,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Text("管理您的 Google 账号", style: TextStyle(
                    color: Colors.blue,
                    fontSize: SizeConstants.CARD_TITLE_SIZE,
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBodyWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          getBodyItem(image: "assets/images/youtube_your_channel.png", title: "您的频道"),
          getBodyItem(image: "assets/images/youtube_work_space.png", title: "YouTube 工作室", image2: "assets/images/youtube_share_2.png"),
          getBodyItem(image: "assets/images/youtube_watch_time.png", title: "观看时长"),
          getBodyItem(image: "assets/images/youtube_tv.png", title: "下载 YouTube TV 应用"),
          getBodyItem(image: "assets/images/youtube_gray_logo.png", title: "订阅 YouTube Premiun"),
          getBodyItem(image: "assets/images/youtube_pay.png", title: "付费会员"),
          getBodyItem(image: "assets/images/youtube_switch_user.png", title: "切换账号"),
          getBodyItem(image: "assets/images/youtube_traceless.png", title: "开启无痕模式"),
          getBodyItem(image: "assets/images/youtube_your_data.png", title: "您在 YouTube 中的数据"),
          Container(
            margin: EdgeInsets.only(top: 6, bottom: 6),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5, color: Colors.black26))
            ),
          ),
          getBodyItem(image: "assets/images/youtube_settings.png", title: "设置"),
          getBodyItem(image: "assets/images/youtube_question.png", title: "帮助和反馈"),
        ],
      ),
    );
  }

  Widget getBodyItem({image, title, image2}) {
    return Container(
      height: 48,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 24),
            width: 24,
            child: Image.asset(image,),
          ),

          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 24, bottom: 3),
              child: Container(
                child: Text(title, style: TextStyle(fontSize: SizeConstants.CARD_TITLE_SIZE),),
              ),
            ),
          ),

          image2 != null ? Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            width: 24,
            child: Image.asset(image2,),
          ) : Container(),
        ],
      ),
    );
  }
}
