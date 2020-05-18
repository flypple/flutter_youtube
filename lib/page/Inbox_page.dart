import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/provider/inbox_provider.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/widget/error_load_widget.dart';

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = ProviderStore.of<InboxProvider>(context);
    return Container(
      color: ColorConstants.YOUTUBE_WHITE,
      child: provider.loadSuccess
          ? getInboxPageWidget(context)
          : ErrorLoadWidget(onPressed: provider.reversalStatus)
    );
  }

  Widget getInboxPageWidget(context) {
    var provider = ProviderStore.of<InboxProvider>(context);
    return Container(
      child: InkWell(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Icon(Icons.notifications, size: 116, color: Colors.black26,),
              ),

              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "您的通知将出现在这里",
                  style: TextStyle(color: ColorConstants.YOUTUBE_BLACK, fontSize: 20, fontWeight: FontWeight.w500, height: 1.7),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(56, 0, 56, 0),
                child: Text(
                  "订阅您喜欢的频道即可在这些频道有新视频时收到通知",
                  style: TextStyle(color: ColorConstants.YOUTUBE_GRAY, fontSize: 15, fontWeight: FontWeight.w500, height: 1.7),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        onTap: provider.reversalStatus,
      ),
    );
  }
}
