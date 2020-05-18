import 'package:flutter/material.dart';
import 'package:flutter_youtube/widget/avatar_widget.dart';

import '../constants.dart';

class CardFooterWidget extends StatelessWidget {

  String icon;
  String title;
  String desc;
  List<String> menuList;
  int maxTitleLines;
  double titleSize;
  int maxSubTitleLines;
  double subTitleSize;


  CardFooterWidget(this.icon, this.title, this.desc, {
    this.menuList,
    this.maxTitleLines = 2,
    this.titleSize = SizeConstants.CARD_TITLE_SIZE,
    this.maxSubTitleLines = 2,
    this.subTitleSize = SizeConstants.CARD_SUB_TITLE_SIZE,
  });

  @override
  Widget build(BuildContext context) {

    return initWidget(context);
  }

  @override
  Widget initWidget(BuildContext context) {
    List<Widget> list = [];
    if (icon != null) {
      // 头像
      list.add(Container(
        width: 64,
        margin: EdgeInsets.only(left: 2, top: 6, right: 4),
        child: AvatarWidget(icon),
      ));
    }

    // 标题
    list.add(Container(
      child: Expanded(
        flex: 1,
        child: _getDescWidget(),
      ),
    ));

    if (menuList != null && menuList.isNotEmpty) {
      // 更多按钮
      list.add(Material(
        child: Container(
            color: ColorConstants.YOUTUBE_WHITE,
            alignment: Alignment.topRight,
            width: 32,
            height: 32,
            child: PopupMenuButton(
              itemBuilder: (context) {
                return menuList.map((item) {
                  return PopupMenuItem(value: item, child: Text(item),);
                }).toList();
              },
              icon: Icon(Icons.more_vert, size: 18, color: ColorConstants.YOUTUBE_GRAY_2,),
            )
        ),
      ));
    }

    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list,
        ),
      ),
      onTap: () {

      },
    );
  }

  Widget _getDescWidget() {
    List<Widget> list = [
      // 标题
      Container(
        margin: EdgeInsets.only(top: 4),
        child: Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? SizeConstants.CARD_TITLE_SIZE,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: ColorConstants.YOUTUBE_BLACK,
          ),
          maxLines: maxTitleLines ?? 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ];

    if (desc != null) {
      list.add(
        Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(
            desc,
            style: TextStyle(
              fontSize: subTitleSize ?? SizeConstants.CARD_SUB_TITLE_SIZE,
              color: ColorConstants.YOUTUBE_GRAY_2,
            ),
            maxLines: maxSubTitleLines ?? 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      )
    );
  }
}
