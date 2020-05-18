import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_youtube/page/index_page.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/utils/status_bar_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("MyApp.bulid() ==>  ${hashCode}");
    StatusBarUtils.setWhiteStatusBarColor();
    return MaterialApp(
      title: 'Flutter Youtube',
      theme: ThemeData(

        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: ProviderStore.initIndexPage(IndexPage()),
    );
  }

  MyApp() {
    print("MyApp() ==>  ${hashCode}");
  }
}
