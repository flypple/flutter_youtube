import 'package:flutter/material.dart';
import 'package:flutter_youtube/utils/status_bar_utils.dart';

import '../constants.dart';

class RecorderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatusBarUtils.setBlackStatusBarColor();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.YOUTUBE_BLACK_3,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.clear, size: 28, color: ColorConstants.YOUTUBE_WHITE,), onPressed: ()=> Navigator.pop(context),
        ),
      ),
      body: Container(
        color: ColorConstants.YOUTUBE_BLACK_3,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 280,
              height: 280,
              child: Image.asset("assets/images/youtube_upload_bg.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Text(
                "开始上传或录制",
                style: TextStyle(
                  color: ColorConstants.YOUTUBE_WHITE,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(36, 24, 36, 24),
              child: Text(
                "To create a new video, allow access to Photos, Camera, and Microphone",
                style: TextStyle(
                  color: ColorConstants.YOUTUBE_WHITE,
                  fontSize: SizeConstants.CARD_TITLE_SIZE,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 48,
              margin: EdgeInsets.only(top: 12, bottom: 48),
              child: RaisedButton(
                padding: EdgeInsets.only(left: 18, right: 18),
                child: Text(
                  "授予权限",
                  style: TextStyle(
                    color: ColorConstants.YOUTUBE_BLACK,
                    fontSize: SizeConstants.CARD_TITLE_SIZE,
                  ),
                  textAlign: TextAlign.center,
                ),
                color: ColorConstants.YOUTUBE_BLUE_2,
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
