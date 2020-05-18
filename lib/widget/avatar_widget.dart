import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AvatarWidget extends StatelessWidget {

  String avatar;

  AvatarWidget(this.avatar);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      alignment: Alignment.center,
      /*decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: ColorConstants.YOUTUBE_GRAY, width: 0.2),
      ),*/
      child: Container(
        height: 40,
        width: 40,
        child: CircleAvatar(
          radius: 20,
          backgroundImage: CachedNetworkImageProvider(avatar),
        ),
      ),/*Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(avatar),
          ),
          Positioned(
            child: CircleAvatar(
              radius: 5,
              backgroundImage: AssetImage("assets/image/author_icon.png"),
            ),
            right: 0.8,
            bottom: 0.8,
          )
        ],
      ),*/
    );
  }
}
