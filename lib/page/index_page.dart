import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/page/Inbox_page.dart';
import 'package:flutter_youtube/page/account_page.dart';
import 'package:flutter_youtube/page/explore_page.dart';
import 'package:flutter_youtube/page/home_page.dart';
import 'package:flutter_youtube/page/media_library_page.dart';
import 'package:flutter_youtube/page/recorder_page.dart';
import 'package:flutter_youtube/page/subscriptions_page.dart';
import 'package:flutter_youtube/provider/index_provider.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/provider/video_player_provider.dart';
import 'package:flutter_youtube/utils/status_bar_utils.dart';
import 'package:flutter_youtube/widget/searh_bar_delegate.dart';
import 'package:flutter_youtube/widget/video/window_player_widget.dart';

import '../constants.dart';

class IndexPage extends StatelessWidget {

  final List<Widget> _pages = [
    ProviderStore.initHomePage(HomePage()),
    ProviderStore.initExplorePage(ExplorePage()),
    ProviderStore.initSubscriptionsPage(SubscriptionsPage()),
    ProviderStore.initInboxPage(InboxPage()),
    ProviderStore.initMediaLibraryPage(MediaLibraryPage()),
  ];

  final List<IconData> _tabIcons = [
    Icons.home,
    Icons.explore,
    Icons.subscriptions,
    Icons.email,
    Icons.video_library,
  ];

  final List<String> _tabNames = [
    "首页",
    "探索",
    "订阅内容",
    "收件箱",
    "媒体库",
  ];


  IndexPage() {
    print("IndexPage() ==>  ${hashCode}");
  }

  @override
  Widget build(BuildContext context) {

    print("IndexPage.build() ==>  ${hashCode}");
    var instance = ScreenUtil.getInstance();
    var width = instance.screenWidth;
    var indexProvider = ProviderStore.of<IndexProvider>(context);
    var playerProvider = ProviderStore.of<VideoPlayerProvider>(context);

    List<Widget> list = [
      IndexedStack( //5个主体页面
        index: indexProvider.index,
        children: _pages,

      ),
    ];

    if (playerProvider.currentFeedItem != null) {
      list.add(Positioned(
        bottom: 1,
        child: Container(

          width: width,
          child: WindowPlayerWidget(),
        ),
      ));
    }

    return Container(
      child: Scaffold(
        appBar: _getAppBar(context),
        body: Stack(

          children: list,
        ),
        bottomNavigationBar: _getBottomBar(context, indexProvider.index),
      ),
    );
  }

  // 底部导航栏
  Widget _getBottomBar(BuildContext context, int currentIndex) {
    List<Widget> tabItems = [];
    for (int i = 0; i < _tabNames.length; i++) {
      bool isSelected = currentIndex == i;
      tabItems.add(_getTabItem(context, i, _tabNames[i], _tabIcons[i], isSelected));
    }
    return BottomAppBar(
      color: ColorConstants.YOUTUBE_WHITE,
      child: Container(
        height: 48,
        child: Row(
          children: tabItems,
        ),
      ),
    );
  }

  // 导航栏按钮
  Widget _getTabItem(BuildContext context, int index, String name, IconData iconData, bool isSelected){
    Color color = isSelected ? ColorConstants.YOUTUBE_RED : ColorConstants.YOUTUBE_GRAY;
    return Container(
      child: Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque, //自己处理时事件
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(child: Icon(iconData, color: color,), height: 27,),
                Text(name, style: TextStyle(fontSize: 10, color: color),),
              ],
            ),
          ),
          onTap: () {
            ProviderStore.of<IndexProvider>(context).changeIdnex(index);
          },
        ),
      ),
    );
  }

  // AppBar
  Widget _getAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(48),
      child: AppBar(
        elevation: 2,
        title: Container(
          child: Row(
            children: <Widget>[
              Container(
                height: 32,
                width: 96,
                child: Image.asset("assets/images/youtube.png"),
              ),
              Expanded(
                flex: 1,
                child: _getAppBarMenu(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // AppBarMenu
  Widget _getAppBarMenu(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          _getAppBarMenuItem(
            marginRight: 7.0,
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.videocam, color: ColorConstants.YOUTUBE_GRAY,),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return RecorderPage();
                })).then((value) => StatusBarUtils.setWhiteStatusBarColor());
              },
            ),
          ),

          _getAppBarMenuItem(
            marginLeft: 7.0,
            marginRight: 7.0,
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.search, color: ColorConstants.YOUTUBE_GRAY,),
              onPressed: () {
                showSearch(context: context, delegate: SearchBarDelegate());
              },
            ),
          ),

          _getAppBarMenuItem(
            marginLeft: 7.0,
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: ColorConstants.YOUTUBE_ORANGE,
                    borderRadius: BorderRadius.all(
                        Radius.circular(12))
                ),
                child: Center(
                  child: Text(
                    "q",
                    style: TextStyle(color: ColorConstants.YOUTUBE_WHITE,
                        fontSize: 14,
                        height: 0.6),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return AccountPage();
                }));
              },
            ),
          ),

        ],
      ),
    );
  }

  // 获取AppBarMenuItem
  Widget _getAppBarMenuItem({marginLeft = 0.0, marginRight = 0.0, @required child,}) {
    return Container(
      width: 32,
      height: 32,
      margin: EdgeInsets.only(left: marginLeft, right: marginRight),
      child: child,
    );
  }
}
