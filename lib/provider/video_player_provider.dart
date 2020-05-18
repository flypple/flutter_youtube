import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerProvider with ChangeNotifier {

  FeedItem currentFeedItem;

  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  VideoPlayerProvider({this.currentFeedItem});

  void setCurrentFeedItem(FeedItem feedItem) {
    currentFeedItem = feedItem;
    notifyListeners();
  }

  void pause() {
    chewieController.pause();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }
}