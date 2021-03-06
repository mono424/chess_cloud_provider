library chess_cloud_provider;

import 'package:chess_cloud_provider/models/game_time_type.dart';
import 'package:chess_cloud_provider/provider/lichess/models/lichess_user_ratings.dart';
import 'package:chess_cloud_provider/provider/lichess/models/lichess_playtime.dart';
import 'package:chess_cloud_provider/provider/lichess/models/lichess_rating_info.dart';

class LichessUser {
  late String id;
  late String username;
  late bool online;
  late LichessUserRatings userRatings;
  late int createdAt;
  late int seenAt;
  late LichessPlayTime playTime;
  late String language;
  late String url;

  LichessUser(
      {required this.id,
      required this.username,
      required this.online,
      required this.userRatings,
      required this.createdAt,
      required this.seenAt,
      required this.playTime,
      required this.language,
      required this.url});

  LichessRatingInfo getRating(GameTimeType type) {
    switch (type) {
      case GameTimeType.bullet:
        return userRatings.bullet;
      case GameTimeType.blitz:
        return userRatings.blitz;
      case GameTimeType.rapid:
        return userRatings.rapid;
      case GameTimeType.classical:
        return userRatings.classical;
      case GameTimeType.correspondence:
        return userRatings.correspondence;
      default:
        return userRatings.classical;
    }
  }

  LichessUser.fromJson(Map<String, dynamic> json) {
    id = (json['id'] != null && json['id'] is String) ? json['id'] : null;
    username = json['username'];
    online = json['online'];
    userRatings = LichessUserRatings.fromJson(json['perfs']);
    createdAt = json['createdAt'];
    seenAt = json['seenAt'];
    playTime = LichessPlayTime.fromJson(json['playTime']);
    language = json['language'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['username'] = username;
    data['online'] = online;
    data['perfs'] = userRatings.toJson();
    data['createdAt'] = createdAt;
    data['seenAt'] = seenAt;
    data['playTime'] = playTime.toJson();
    data['language'] = language;
    data['url'] = url;
    return data;
  }

  @override
  bool operator ==(o) =>
      o is LichessUser && o.username == username && o.id == id;
}




