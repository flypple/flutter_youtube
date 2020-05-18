import 'package:flustars/flustars.dart';
import 'package:flutter_youtube/model/feed_item.dart';

class TextUtils {
  static bool isEmpty(String str) {
    return str == null || str.isEmpty;
  }

  static bool isNotEmpty(String str) {
    return str != null && str.isNotEmpty;
  }

  static String getDurationText(int duration) {
    if (duration == null || duration < 0) {
      return "";
    }
    String format = "mm:ss";
    if ((duration / 3600) > 1) {
      format = "HH:mm:ss";
    }
    ///isUtc为false时会把时间自动改为北京时间，这样默认就从8点开始算了，会影响到小时数的展示。
    ///isUtc为true表示时间为世界时间，起点为0点。
    return DateUtil.formatDateMs(duration * 1000, format: format, isUtc: true);
  }

  static String getViewCountText(int count) {
    String text = "0次";
    if (count < 10000 && count >= 0) {
      text = "$count次";
    } else {
      text = "${(count / 10000).toStringAsFixed(1)}万次";
    }
    return text;
  }

  static String getTimeDifferenceText(int timeSecond) {
    String text = "今天";
    var dateTime = DateTime.fromMicrosecondsSinceEpoch(timeSecond * 1000);
    var nowDateTime = DateTime.now();
    if (nowDateTime.year != dateTime.year) {
      text = "${nowDateTime.year - dateTime.year}年前";
    } else if (nowDateTime. month != dateTime.month) {
      text = "${nowDateTime.month - dateTime.month}个月前";
    } else if (nowDateTime. day != dateTime.day) {
      text = "${nowDateTime.day - dateTime.day}天前";
    }
    return text;
  }

  static String getGroupDesc(FeedItem feedItem) {
    return "${feedItem.author}  ·  ${TextUtils.getViewCountText(feedItem.viewCounts)}观看  ·  ${TextUtils.getTimeDifferenceText(feedItem.time)}";
  }
}