import 'package:flutter/material.dart';
import 'package:flutter_youtube/page/base_loading_page.dart';
import 'package:flutter_youtube/provider/base_loading_provider.dart';
import 'package:flutter_youtube/provider/explore_provider.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/widget/card/card_creator.dart';
import 'package:flutter_youtube/widget/card_grid_widget.dart';

class ExplorePage extends BaseLoadingPage {
  @override
  BaseLoadingProvider getProvider(BuildContext context) {
    return ProviderStore.of<ExploreProvider>(context);
  }

  @override
  List<Widget> getWidgetList(BuildContext context) {
    var provider = getProvider(context) as ExploreProvider;
    var list = provider.itemList.map((item) => CardCreator.getCard(item)).toList();
    list.insert(0, CardGridWidget());
    return list;
  }

  @override
  bool hasLoadedData(BuildContext context) {
    var provider = getProvider(context) as ExploreProvider;
    return provider.itemList.isNotEmpty;
  }

  @override
  void loadData(BuildContext context) {
    getProvider(context).loadData();
  }

  @override
  void loadMore(BuildContext context) {
    getProvider(context).loadMoreData();
  }

  @override
  void refreshData(BuildContext context) {
    getProvider(context).refreshData();
  }

}
