import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/provider/video_player_provider.dart';
import 'package:flutter_youtube/widget/video/youtube_controls.dart';
import 'package:video_player/video_player.dart';

import '../../constants.dart';

class WindowPlayerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var playerProvider = ProviderStore.of<VideoPlayerProvider>(context);
    if (playerProvider.videoPlayerController == null) {
      String url = "", title = "找不到视频";
      if (playerProvider.currentFeedItem != null) {
        url = playerProvider.currentFeedItem.videoUrl;
        title = playerProvider.currentFeedItem.title;
      }
      playerProvider.videoPlayerController = VideoPlayerController.network(url);
      playerProvider.chewieController = ChewieController(
        videoPlayerController: playerProvider.videoPlayerController,
        aspectRatio: 2,

        autoPlay: true,
        looping: false,
        showControls: false,
        showControlsOnInitialize: false,
      );
    }
    return Container(
      height: 56,
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Material(
        color: ColorConstants.YOUTUBE_WHITE,
        elevation: 3,
        child: Row(
          children: <Widget>[
            Container(
              height: 56,
              width: 112,
              child: Chewie(
                controller: playerProvider.chewieController,
              ),
            )
          ],
        ),
      ),
    );
  }

}
