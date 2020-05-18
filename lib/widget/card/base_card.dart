import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/model/feed_item.dart';

abstract class BaseCardItemWidget extends StatelessWidget {
  FeedItem feedItem;
  bool hasBorder;
  BaseCardItemWidget(this.feedItem, {this.hasBorder = true});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    widgetList.add(initWidget(context));
    if (hasBorder) {
      widgetList.add(Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black26, width: 0.5),
          ),
        ),
      ));
    }

    return Container(
      color: ColorConstants.YOUTUBE_WHITE,
      child: Column(
        children: widgetList,
      ),
    );
  }

  Widget initWidget(BuildContext context);
}
