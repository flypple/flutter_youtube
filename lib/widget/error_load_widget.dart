import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';

class ErrorLoadWidget extends StatelessWidget {
  Function onPressed;

  ErrorLoadWidget({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.YOUTUBE_WHITE,
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset("assets/images/youtube_error.png", width: 190,),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Text("网络连接错误", style: TextStyle(fontSize: 18, color: ColorConstants.YOUTUBE_BLACK),),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text("请检查网络连接，点击屏幕重试", style: TextStyle(fontSize: 14, color: ColorConstants.YOUTUBE_GRAY),),
              ),
            ],
          ),
        ),
        onTap: onPressed ?? (){},
      ),
    );
  }
}
