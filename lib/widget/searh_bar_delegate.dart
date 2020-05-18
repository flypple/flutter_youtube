import 'package:flutter/material.dart';
import 'package:flutter_youtube/constants.dart';

class SearchBarDelegate extends SearchDelegate<String> {

  String get searchFieldLabel => "搜索 YouTuBe";

  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      Container(
        child: IconButton(
          icon: Icon(Icons.clear, color: ColorConstants.YOUTUBE_GRAY_2,),
          onPressed: () {
            query = "";
          },
        ),
      ),
      Container(
        child: IconButton(
          icon: Icon(Icons.keyboard_voice, color: ColorConstants.YOUTUBE_GRAY_2,),
          onPressed: () {

          },
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          color: ColorConstants.YOUTUBE_GRAY_2,
          progress: transitionAnimation,
        ),
        onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 56),
      alignment: Alignment.topCenter,
      child: Text("搜索你感兴趣的节目", style: TextStyle(color: ColorConstants.YOUTUBE_GRAY),),
    );
  }

}