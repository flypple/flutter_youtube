import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';
import 'package:flutter_youtube/provider/provider_store.dart';
import 'package:flutter_youtube/provider/subscriptions_provider.dart';

class SubscriptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: initWidget(context),
      ),
    );
  }

  Widget initWidget(context) {
    return Container(
      child: Column(
        children: <Widget>[
          getHeaderWidget(),
          getExpansionPanel(0, context),
          getExpansionPanel(1, context),
        ],
      ),
    );
  }

  Widget getExpansionPanel(index, context) {
    var provider = ProviderStore.of<SubscriptionsProvider>(context);
    var list = provider.data.map<Widget>((item) {
      return getExpansionPanelItem(item);
    }).toList();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: ListTile(
              title: Text("YouTuBe 精选", style: TextStyle(fontSize: SizeConstants.CARD_TITLE_SIZE),),
            ),
          ),
          Column(
            children: list.getRange(0, 3).toList(),
          ),
          ExpansionLayout(
            isExpanded: provider.openStatusList[index],
            onExpansionChanged: (value){
              print("ExpansionLayout =========> $value");
            },
            children: list.getRange(3, list.length).toList(),
          ),
          Container(
            height: 24,
            margin: EdgeInsets.only(bottom: 10, top: 10),
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                child: Icon(provider.openStatusList[index] ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: ColorConstants.YOUTUBE_GRAY,),
              ),
              onTap: () => provider.reversalOpenState(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget getExpansionPanelItem(item) {
    List<Widget> widgetList = [
      Container(
        child: Text(item[1], style: TextStyle(
          color: ColorConstants.YOUTUBE_BLACK,
          fontSize: SizeConstants.CARD_TITLE_SIZE,
        ),),
      ),
      Container(
        child: Text("${item[2]}位订阅者", style: TextStyle(
          color: ColorConstants.YOUTUBE_GRAY_2,
          fontSize: SizeConstants.CARD_SUB_TITLE_SIZE,
        ),),
      ),
      Container(
        margin: EdgeInsets.only(top: 3),
        child: Text("订阅", style: TextStyle(
          color: ColorConstants.YOUTUBE_RED,
          fontSize: SizeConstants.CARD_TITLE_SIZE,
          fontWeight: FontWeight.w500,
        ),),
      ),
    ];
    if (item.length > 3) {
      widgetList.insert(2, Container(
        child:  Text("${item[3]}个视频", style: TextStyle(
          color: ColorConstants.YOUTUBE_GRAY_2,
          fontSize: SizeConstants.CARD_SUB_TITLE_SIZE,
        ),),
      ));
    }
    return Container(
      height: 100,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(item[0],),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: widgetList,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getHeaderWidget() {
    return Container(
      height: 310,
      color: ColorConstants.YOUTUBE_WHITE_2,
      alignment: Alignment.center,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 190,
              child: Image.asset("assets/images/youtube_subbg.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "即时了解最新视频",
                style: TextStyle(color: ColorConstants.YOUTUBE_BLACK, fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text(
                "订阅您最喜爱的频道，即时获知其中的最新视频",
                style: TextStyle(color: ColorConstants.YOUTUBE_GRAY, fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const Duration _kExpand = Duration(milliseconds: 200);

class ExpansionLayout extends StatefulWidget {
  const ExpansionLayout({
    Key key,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.isExpanded,
  }) : super(key: key);

  final ValueChanged<bool> onExpansionChanged;
  final List<Widget> children;

  final Color backgroundColor;
  //增加字段控制是否折叠
  final bool isExpanded;

  final Widget trailing;

  @override
  _ExpansionLayoutState createState() => _ExpansionLayoutState();
}

class _ExpansionLayoutState extends State<ExpansionLayout>
    with SingleTickerProviderStateMixin {
//折叠展开的动画，主要是控制height
  static final Animatable<double> _easeInTween =
  CurveTween(curve: Curves.easeIn);
  AnimationController _controller;
  Animation<double> _heightFactor;

  bool _isExpanded;

  @override
  void initState() {
    super.initState();
    //初始化控制器以及初始状态
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _isExpanded = widget.isExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = widget.isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
        });
      }
      //保存页面数据
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    //回调展开事件
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRect(
            child: Align(
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //执行以下对应的Tap事件
    _handleTap();
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );
  }
}
