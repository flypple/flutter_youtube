import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_youtube/page/video_detail_page.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/provider/video_player_provider.dart';
import 'package:flutter_youtube/utils/status_bar_utils.dart';
import 'package:flutter_youtube/widget/video/youtube_controls.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setBlackStatusBar();
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                getPlayerWidget(context),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: VideoDetailPage(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  Widget getPlayerWidget(BuildContext context) {
    var provider = ProviderStore.of<VideoPlayerProvider>(context);
    if (provider.videoPlayerController == null) {
      String url = "", title = "找不到视频";
      if (provider.currentFeedItem != null) {
        url = provider.currentFeedItem.videoUrl;
        title = provider.currentFeedItem.title;
      }
      provider.videoPlayerController = VideoPlayerController.network(url);
      provider.chewieController = ChewieController(
        videoPlayerController: provider.videoPlayerController,
        aspectRatio: 1.80,
        autoPlay: true,
        looping: false,
        customControls: YoutubeControls(videoName: title,),
      );
    }

    return Container(
      height: 200,
      alignment: Alignment.center,
      color: Colors.black,
      child: Chewie(
        controller: provider.chewieController,
      ),
    );
  }

  void setBlackStatusBar() async {
    StatusBarUtils.setBlackStatusBarColor();
  }
}
