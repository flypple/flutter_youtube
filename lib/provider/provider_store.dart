import 'package:flutter/material.dart';
import 'package:flutter_youtube/model/feed_item.dart';
import 'package:flutter_youtube/provider/home_provider.dart';
import 'package:flutter_youtube/provider/index_provider.dart';
import 'package:flutter_youtube/provider/subscriptions_provider.dart';
import 'package:flutter_youtube/provider/video_detail_provider.dart';
import 'package:flutter_youtube/provider/video_player_provider.dart';
import 'package:provider/provider.dart';

import 'explore_provider.dart';
import 'inbox_provider.dart';
import 'media_library_provider.dart';

class ProviderStore {
  static Widget initIndexPage(@required Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexProvider(0),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoPlayerProvider(),
        ),
      ],
      child: child,
    );
  }

  static Widget initHomePage(@required Widget child) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: child,
    );
  }

  static Widget initExplorePage(@required Widget child) {
    return ChangeNotifierProvider(
      create: (context) => ExploreProvider(),
      child: child,
    );
  }

  static Widget initSubscriptionsPage(@required Widget child) {
    return ChangeNotifierProvider(
      create: (context) => SubscriptionsProvider(),
      child: child,
    );
  }

  static Widget initInboxPage(@required Widget child) {
    return ChangeNotifierProvider(
      create: (context) =>InboxProvider(),
      child: child,
    );
  }

  static Widget initMediaLibraryPage(@required Widget child) {
    return ChangeNotifierProvider(
      create: (context) =>MediaLibraryProvider(),
      child: child,
    );
  }

  static Widget initVideoDetailPage(@required Widget child, @required FeedItem feedItem) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VideoPlayerProvider(currentFeedItem: feedItem),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoDetailProvider(),
        ),
      ],
      child: child,
    );
  }

  static T of<T>(BuildContext context) {
    try {
      return Provider.of<T>(context);
    } catch (e) {
      print("尚未找到类型为${T}的Provider");
      return null;
    }
  }

}