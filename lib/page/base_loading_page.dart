import 'package:flutter/material.dart';
import 'package:flutter_youtube/provider/base_loading_provider.dart';

import '../constants.dart';

abstract class BaseLoadingPage extends StatelessWidget {

  BuildContext _context;

  ScrollController _controller;


  BaseLoadingPage() {
    print("BaseLoadingPage() ==>  ${hashCode}");
  }

  @override
  Widget build(BuildContext context) {
    print("BaseLoadingPage.build() ==>  ${hashCode}");
    if (_controller == null) {
      _controller = ScrollController();
      _controller.addListener(() {
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          if (getProvider(context).canLoadMore()) {
            print("$this加载更多数据");
            loadMore(context);
          }
        }
      });
    }
    this._context = context;
    if (getProvider(context).needFirsLoadData) {
      print("${this.hashCode}初次加载");
        loadData(context);
      getProvider(context).needFirsLoadData = false;
    }
    return initWidget();
  }

  void loadData(BuildContext context);

  void loadMore(BuildContext context);

  void refreshData(BuildContext context);

  Future<void> onRefresh() async {
    await refreshData(_context);
  }

  bool hasLoadedData(BuildContext context);

  Widget initWidget() {
    Widget child;
    var provider = getProvider(_context);
    if (provider.isLoading) {
      child = getLoadingWidget();
    } else if (provider.error) {
      child = getErrorWidget();
    } else {
      child = getRefreshIndicatorList();
    }
    return Container(
      child: child,
    );
  }

  BaseLoadingProvider getProvider(BuildContext context);

  Widget getLoadingWidget() {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.YOUTUBE_BLUE)),
    );
  }

  Widget getErrorWidget() {
    return InkWell(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/image/ic_eye_black_error.png"),
            Text("网络错误",),
            Text("点击屏幕重试"),
          ],
        ),
      ),
      onTap: () {
        loadData(_context);
      },
    );
  }

  Widget getRefreshIndicatorList() {
    var list = getWidgetList(_context);

    if (getProvider(_context).canLoadMore()) {
      list.add(getLoadingMoreWidget());
    }

    Widget listView = ListView(
      controller: _controller,
      children: list,
    );

    if (getProvider(_context).canRefresh()) {

      return RefreshIndicator(
        onRefresh: onRefresh,
        backgroundColor: ColorConstants.YOUTUBE_WHITE,
        color: ColorConstants.YOUTUBE_BLACK,
        child: listView,
      );
    }

    return listView;
  }

  List<Widget> getWidgetList(BuildContext context);

  Widget getLoadingMoreWidget() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: ColorConstants.YOUTUBE_WHITE,
        border: Border(top: BorderSide(color: ColorConstants.YOUTUBE_GRAY, width: 1))
      ),
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.YOUTUBE_BLUE),
      ),
    );
  }

}
