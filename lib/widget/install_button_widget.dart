import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';

class InstallButtonWidget extends StatelessWidget {
  String action;
  bool hasRadius;
  MainAxisAlignment mainAxisAlignment;

  InstallButtonWidget(this.action, {this.hasRadius = true, this.mainAxisAlignment = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    double radiu = hasRadius ? SizeConstants.IMAGE_RADIU_SIZE_3 : 0;
    return Container(
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[
          Container(
            child: Text(
              action,
              style: TextStyle(
                color: ColorConstants.YOUTUBE_BLUE,
                fontSize: SizeConstants.CARD_TITLE_SIZE,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 4, top: 4),
            child: Icon(
              Icons.file_download,
              color: ColorConstants.YOUTUBE_BLUE,
              size: SizeConstants.CARD_TITLE_SIZE,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: ColorConstants.YOUTUBE_BLUE_WHITE,
        borderRadius: BorderRadius.all(Radius.circular(radiu)),
      ),
    );
  }
}
