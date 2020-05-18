// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) {
  return FeedItem(
      json['type'] as String,
      json['icon'] as String,
      json['cover'] as String,
      json['videoUrl'] as String,
      json['title'] as String,
      json['author'] as String,
      json['desc'] as String,
      json['category'] as String,
      json['favour'] as int,
      json['trample'] as int,
      json['duration'] as int,
      json['commentCount'] as int,
      (json['star'] as num)?.toDouble(),
      json['tag'] as String,
      json['viewCounts'] as int,
      json['time'] as int,
      (json['feedList'] as List)
          ?.map((e) =>
              e == null ? null : FeedItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$FeedItemToJson(FeedItem instance) => <String, dynamic>{
      'type': instance.type,
      'icon': instance.icon,
      'cover': instance.cover,
      'videoUrl': instance.videoUrl,
      'title': instance.title,
      'author': instance.author,
      'desc': instance.desc,
      'category': instance.category,
      'favour': instance.favour,
      'trample': instance.trample,
      'duration': instance.duration,
      'commentCount': instance.commentCount,
      'star': instance.star,
      'tag': instance.tag,
      'viewCounts': instance.viewCounts,
      'time': instance.time,
      'feedList': instance.feedList
    };
