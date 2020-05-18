import 'package:flutter/material.dart';
import 'package:flutter_youtube/page/base_loading_page.dart';
import 'package:flutter_youtube/provider/base_loading_provider.dart';
import 'package:flutter_youtube/provider/home_provider.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/widget/card/card_creator.dart';

class HomePage extends BaseLoadingPage {

  @override
  List<Widget> getWidgetList(BuildContext context) {
    var provider = getProvider(context) as HomeProvider;
    var list = provider.itemList.map((item) => CardCreator.getCard(item)).toList();
    return list;
  }

  @override
  void loadData(BuildContext context){
    getProvider(context).loadData();
  }

  @override
  void loadMore(BuildContext context){
    getProvider(context).loadMoreData();
  }

  @override
  void refreshData(BuildContext context){
    getProvider(context).refreshData();
  }

  @override
  BaseLoadingProvider getProvider(BuildContext context) {
    return ProviderStore.of<HomeProvider>(context);
  }

  @override
  bool hasLoadedData(BuildContext context) {
    var provider = getProvider(context) as HomeProvider;
    return provider.itemList.isNotEmpty;
  }

}
