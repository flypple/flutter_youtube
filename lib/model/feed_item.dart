import 'package:json_annotation/json_annotation.dart';

part 'feed_item.g.dart';

@JsonSerializable()
class FeedItem extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'videoUrl')
  String videoUrl;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'favour')
  int favour;

  @JsonKey(name: 'trample')
  int trample;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'commentCount')
  int commentCount;

  @JsonKey(name: 'star')
  double star;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'viewCounts')
  int viewCounts;

  @JsonKey(name: 'time')
  int time;

  @JsonKey(name: 'feedList')
  List<FeedItem> feedList;

  FeedItem(this.type,this.icon,this.cover,this.videoUrl,this.title,this.author,this.desc,this.category,this.favour,this.trample,this.duration,this.commentCount,this.star,this.tag,this.viewCounts,this.time,this.feedList,);

  factory FeedItem.fromJson(Map<String, dynamic> srcJson) => _$FeedItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FeedItemToJson(this);

}



