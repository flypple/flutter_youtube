import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/utils/text_utils.dart';

import '../constants.dart';

class CoverWidget extends StatelessWidget {

  String imageUrl;
  int duration;
  double aspectRatio;

  CoverWidget(this.imageUrl, {this.duration, this.aspectRatio = 1.728});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getCoverWidget(),
    );
  }

  Widget _getCoverWidget() {
    return Container(
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          alignment: Alignment.bottomRight,
          child: _getDurationWidget(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getDurationWidget() {
    bool hasDuration = duration != null;
    return Visibility(
      visible: hasDuration,
      child: Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.all(Radius.circular(SizeConstants.IMAGE_RADIU_SIZE_3)),
        ),
        child: Text(
          TextUtils.getDurationText(duration),
          style: TextStyle(
            color: ColorConstants.YOUTUBE_WHITE,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
