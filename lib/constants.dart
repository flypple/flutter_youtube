import 'dart:ui';

import 'package:flutter/material.dart';


class SizeConstants {
  static const double CARD_TITLE_SIZE = 16;
  static const double CARD_TITLE_LITTLE_SIZE = 14;
  static const double CARD_BIG_TITLE_SIZE = 20;


  static const double CARD_SUB_TITLE_SIZE = 13;
  static const double CARD_SUB_TITLE_LITTLE_SIZE = 11;

  static const double TEXT_CARD_HEIGHT = 48;
  static const double INSTALL_BUTTON_HEIGHT = 36;

  static const double IMAGE_RADIU_SIZE_3 = 3;
  static const double IMAGE_RADIU_SIZE_5 = 5;
  static const double IMAGE_RADIU_SIZE_8 = 8;
}

class ColorConstants {
  static const Color YOUTUBE_WHITE = Colors.white;
  static const Color YOUTUBE_WHITE_2 = Color(0xFFE3E3E3);
  static const Color YOUTUBE_BLACK = Colors.black;
  static const Color YOUTUBE_BLACK_2 = Color(0xFF444444);
  static const Color  YOUTUBE_BLACK_3 = Color(0xFF282828);
  static const Color YOUTUBE_RED = Color(0xFFE93323);
  static const Color YOUTUBE_GRAY = Color(0xFF606060); // 主要给导航按钮和分割线用
  static const Color YOUTUBE_GRAY_2 = Color(0xFF888888); // 主要给文字使用
  static const Color YOUTUBE_BLUE = Color(0xFF285ECE);
  static const Color YOUTUBE_BLUE_2 = Color(0xFF5CA4F8);
  static const Color YOUTUBE_BLUE_WHITE = Color(0xFFF2F8FE);
  static const Color YOUTUBE_ORANGE = Color(0xFFDD742D);
  static const Color YOUTUBE_YELLOW = Colors.yellow;
  static const Color YOUTUBE_YELLOW_2 = Color(0xFFF1C250);
}

class TextConstants {
  static const List labelList = [
    [
      "#广告",
      "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg"
    ],
    [
      "#创意",
      "http://img.kaiyanapp.com/727bd34a770ba32dd2b7fa225df0cd9b.png?imageMogr2/quality/60/format/jpg"
    ],
    [
      "#旅行",
      "http://img.kaiyanapp.com/0f3513fdfb72434b3a74ccb157406f54.png?imageMogr2/quality/60/format/jpg"
    ],
    [
      "#影视",
      "http://img.kaiyanapp.com/f4bf4df0e077ffa6e9c5f90ce40a6f53.png?imageMogr2/quality/60/format/jpg"
    ],
    [
      "#记录",
      "http://img.kaiyanapp.com/936e0c299688eb88c5ba593a971c7abf.png?imageMogr2/quality/60/format/jpg"
    ],
    [
      "#音乐",
      "http://img.kaiyanapp.com/33cc30cf40de3288a8862d12e7dbd674.png?imageMogr2/quality/60/format/jpg"
    ],
    [
      "#开胃",
      "http://img.kaiyanapp.com/37301e88af9a789e41b89af35aaa77f2.png?imageMogr2/quality/60/format/jpg"
    ],
    [
      "#搞笑",
      "http://img.kaiyanapp.com/6da6ebd197c408a6d0193c58c00583f4.png?imageMogr2/quality/60/format/jpg"
    ],
    [
      "#时尚",
      "http://img.kaiyanapp.com/03bd4fa7429614df5a936f42c09e1275.png?imageMogr2/quality/60/format/jpg"
    ],
    [
      "#动画",
      "http://img.kaiyanapp.com/68fe1a141a27df721496c6711370b1cc.png?imageMogr2/quality/60/format/jpg"
    ],
  ];

  static const List<String> menuListForVideo = [
    "保存到“稍后观看”", "保存到播放列表", "分享", "不感兴趣", "不推荐频道", "举报",
  ];

  static const List<String> menuListForAD = [
    "保存到“稍后观看”", "保存到播放列表", "分享", "为什么显示该广告？", "停止显示此广告",
  ];

  static const List<String> menuListForHistory = [
    "保存到“稍后观看”", "保存到播放列表", "分享", "从观看记录中移除",
  ];

  static const List<String> menuListForLast = [
    "名称首字母(升序)", "最新添加",
  ];

  static const List<List<String>> expansionPanelDataList = [

    ["assets/images/youtube_hot.jpg", "YouTube 热门", "2970万",],
    ["assets/images/youtube_music.jpg", "音乐", "1.11亿",],
    ["assets/images/youtube_sport.jpg", "体育赛事", "7520万",],
    ["assets/images/youtube_game.jpg", "游戏", "8470万",],
    ["assets/images/youtube_movie.jpg", "YouTube 电影", "1.11亿",],
    ["assets/images/youtube_news.jpg", "新闻", "3450万",],
    ["assets/images/youtube_live.jpg", "直播", "1170万",],
    ["assets/images/youtube_youtube.jpg", "YouTube", "3020万", "314",],
    ["assets/images/youtube_v.jpg", "虚拟实境", "334万",],

  ];

  static const String historyString = """{
      "type": "item_video_list",
      "title": "精选视频",
      "feedList": [
        {
          "type": "item_video",
          "icon": "http://img.kaiyanapp.com/924ebc6780d59925c8a346a5dafc90bb.jpeg",
          "cover": "http://img.kaiyanapp.com/da1a29ce48d3310d1cc92823064fe9fa.jpeg?imageMogr2/quality/60/format/jpg",
          "videoUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=194618&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss",
          "title": "和王俊凯一起，带上灵魂去旅行！",
          "author": "开眼生活精选",
          "desc": "开眼与新世相、央视新闻、王俊凯联合推出#人生力量阅读计划#。第二章远方篇-《带上灵魂去旅行》，由王俊凯为你朗读。“人是永恒的变化，好像一束明亮的追光，打在风光之上，那风光便有了飒飒的动感和淼淼的生气。”人们往往在旅行中找回面对日常生活的勇气。对奇遇和风光的期待，也成为了我们向远方继续进发的力量。生活就是最大的一场旅行，祝你总有所收获。本片影像素材均来自开眼社区及开眼平台的专业创作者，你们的每次出发都是对「远方」的再定义。感谢你们，步履不停。",
          "category": "视频",
          "favour": 159409,
          "trample": 654,
          "duration": 130,
          "commentCount": 13,
          "star": 4.8,
          "tag": "生活",
          "viewCounts": 3832324,
          "time": 1589542825000
        },
        {
          "type": "item_video",
          "icon": "http://img.kaiyanapp.com/9e21132a1af49167226389de5833e9df.png?imageMogr2/quality/60/format/jpg",
          "cover": "http://img.kaiyanapp.com/773ab335a497ee6c80c4f4442d79f98a.png?imageMogr2/quality/60/format/jpg",
          "videoUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=194568&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss",
          "title": "飙车界的老司机：无需多言，你懂我懂大家懂",
          "author": "TOPYS",
          "desc": "Papaya Films London 和 Havas Worldwide 合作为杜蕾斯拍摄了一支名为「Feel Right」的 TVC。真的不用解说，你们一看就懂。在座的老司机，别装了~",
          "category": "视频",
          "favour": 58669,
          "trample": 1495,
          "duration": 61,
          "commentCount": 130,
          "star": 4,
          "tag": "创意",
          "viewCounts": 1392324,
          "time": 1589504446000
        },
        {
          "type": "item_video",
          "icon": "http://img.kaiyanapp.com/309f6f8c04be1c1969c2788991ec99e9.png?imageMogr2/quality/60/format/jpg",
          "cover": "http://img.kaiyanapp.com/6ab574d3b9e0007264a95598969a6603.png?imageMogr2/quality/60/format/jpg",
          "videoUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=194430&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss",
          "title": "我是猫，我拍了我的第一支 Vlog",
          "author": "鹿老师",
          "desc": "我 是 猫  ，我 拍 了 我 的 第 一 支 Vlog。导演：@小鹿Lawrence，摄影：@小鹿Lawrence 、@的蓝人，插画：@大文文文儿，文案：@小鹿Lawrence ，@路人Eita，设备：bmpcc 4k / iphone 11 pro / a7m3 ，镜头:  松下12-35 2.8 / 松下莱卡 42.5 1.2 /  24mm 1.4 gm / 85 mm 1.4 gm，软体：Final Cut Pro X / Davinci Resolve Studio。",
          "category": "视频",
          "favour": 98880,
          "trample": 965,
          "duration": 602,
          "commentCount": 101,
          "star": 4.9,
          "tag": "萌宠",
          "viewCounts": 2392324,
          "time": 1589276950000
        },
        {
          "type": "item_video",
          "icon": "http://img.kaiyanapp.com/f4a9aba1c6857ee0cefcdc5aee0a1fc9.png?imageMogr2/quality/60/format/jpg",
          "cover": "http://img.kaiyanapp.com/f4a9aba1c6857ee0cefcdc5aee0a1fc9.png?imageMogr2/quality/60/format/jpg",
          "videoUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=194199&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss",
          "title": "玄幻古风优秀毕设：「念」",
          "author": "开眼创意精选",
          "desc": "广州大学华软软件学院游戏系毕业短片设计「念」。大四实习的时候，一旁的同事和我说纯中国风的短片很少人做，正好自己也是很喜欢这种题材和风格的东西，便想做一番尝试。制作期间因为自己电脑和显卡太菜了，大场景和动力学演算的场景电脑一直死机，一天 10 几次已经是家常便饭，尽管如此，凭借一天天的积累，最后还是艰难的完成了。故事大体是在一个玄幻的古代世界背景，纸醉金迷的生活下人们没有意识到危机在慢慢来临，而这时，察觉到危机的英雄想救出自己记忆中的念想。From ATAI_阿泰",
          "category": "视频",
          "favour": 48880,
          "trample": 895,
          "duration": 129,
          "commentCount": 19,
          "star": 4.6,
          "tag": "创意",
          "viewCounts": 1092324,
          "time": 1589245206000
        },
        {
          "type": "item_video",
          "icon": "http://img.kaiyanapp.com/f2449da39a584c982866b0636bd30c58.png?imageMogr2/quality/60/format/jpg",
          "cover": "http://img.kaiyanapp.com/3886c8d5e701c6af7bcec81b53946c68.jpeg?imageMogr2/quality/60/format/jpg",
          "videoUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=193939&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss",
          "title": "3 分钟穿越春夏秋冬，体验一年四季的极限运动",
          "author": "开眼运动精选",
          "desc": "一年四季究竟可以玩多少种极限运动？这支来自北脸的超帅短片，告诉了你答案。延长生命的不仅有电影，还有运动。看完，是不是很想立马奔出门，来一次酣畅淋漓的健身？From William Binamé",
          "category": "视频",
          "favour": 94880,
          "trample": 1095,
          "duration": 271,
          "commentCount": 79,
          "star": 3.9,
          "tag": "运动",
          "viewCounts": 1892324,
          "time": 1589245279000
        },
        {
          "type": "item_video",
          "icon": "http://img.kaiyanapp.com/f4a9aba1c6857ee0cefcdc5aee0a1fc9.png?imageMogr2/quality/60/format/jpg",
          "cover": "http://img.kaiyanapp.com/e73ae4dd975336540bfc0e504b90d4bd.jpeg?imageMogr2/quality/60/format/jpg",
          "videoUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=194377&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss",
          "title": "OMG！飘了飘了，维也纳居然上天了~",
          "author": "开眼创意精选",
          "desc": "说到维也纳，你会想到什么？奥地利首都还是世界音乐之都？其实这些都不能概括一座城市，导演 Fernando Livschitz 用这支短片描绘了一个飘在天空中的维也纳，真的飘了！From Black Sheep Films",
          "category": "视频",
          "favour": 948800,
          "trample": 10950,
          "duration": 95,
          "commentCount": 790,
          "star": 4.3,
          "tag": "创意",
          "viewCounts": 1892324,
          "time": 1589245279000
        }
      ]
    }""";
}

/*
static const List labelList = [
  [
    "#广告",
    "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#剧情",
    "http://img.kaiyanapp.com/afa27b9c52d2ed2f5f8b5f8c12992fcf.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#运动",
    "http://img.kaiyanapp.com/4cf9360ae41d2350c3a793579f53bc29.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#创意",
    "http://img.kaiyanapp.com/727bd34a770ba32dd2b7fa225df0cd9b.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#旅行",
    "http://img.kaiyanapp.com/0f3513fdfb72434b3a74ccb157406f54.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#影视",
    "http://img.kaiyanapp.com/f4bf4df0e077ffa6e9c5f90ce40a6f53.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#记录",
    "http://img.kaiyanapp.com/936e0c299688eb88c5ba593a971c7abf.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#音乐",
    "http://img.kaiyanapp.com/33cc30cf40de3288a8862d12e7dbd674.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#科技",
    "http://img.kaiyanapp.com/1da6527c7300b7766def87a585952295.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#开胃",
    "http://img.kaiyanapp.com/37301e88af9a789e41b89af35aaa77f2.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#游戏",
    "http://img.kaiyanapp.com/fd5691e646f9de718a817b8d202b1e1c.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#动画",
    "http://img.kaiyanapp.com/68fe1a141a27df721496c6711370b1cc.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#搞笑",
    "http://img.kaiyanapp.com/6da6ebd197c408a6d0193c58c00583f4.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#时尚",
    "http://img.kaiyanapp.com/03bd4fa7429614df5a936f42c09e1275.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#生活",
    "http://img.kaiyanapp.com/3f16bcf95917a4d659c23508b4de6bbf.png?imageMogr2/quality/60/format/jpg"
  ],
  [
    "#综艺",
    "http://img.kaiyanapp.com/a17745312139694dc1f0c40984533328.png?imageMogr2/quality/60/format/jpg"
  ],
];*/
