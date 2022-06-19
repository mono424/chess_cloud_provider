import 'package:chess_cloud_provider/models/game.dart';
import 'package:chess_cloud_provider/provider/lichess/models/lichess_compat.dart';
import 'package:chess_cloud_provider/provider/lichess/models/lichess_opponent.dart';
import 'package:chess_cloud_provider/provider/lichess/models/lichess_variant.dart';

class LichessGame extends GameResult {
  late final String fullId;
  late final String gameId;
  late final String fen;
  late final String color;
  late final String lastMove;
  late final String source;
  late final LichessVariant variant;
  late final String speed;
  late final String perf;
  late final bool rated;
  late final bool hasMoved;
  late final LichessOpponent opponent;
  late final bool isMyTurn;
  late final LichessCompat compat;
  late final String id;

  LichessGame(
      {required this.fullId,
      required this.gameId,
      required this.fen,
      required this.color,
      required this.lastMove,
      required this.source,
      required this.variant,
      required this.speed,
      required this.perf,
      required this.rated,
      required this.hasMoved,
      required this.opponent,
      required this.isMyTurn,
      required this.compat,
      required this.id});

  LichessGame.fromJson(Map<String, dynamic> json) {
    fullId = json['fullId'];
    gameId = json['gameId'];
    fen = json['fen'];
    color = json['color'];
    lastMove = json['lastMove'];
    source = json['source'];
    variant = LichessVariant.fromJson(json['variant']);
    speed = json['speed'];
    perf = json['perf'];
    rated = json['rated'];
    hasMoved = json['hasMoved'];
    opponent = LichessOpponent.fromJson(json['opponent']);
    isMyTurn = json['isMyTurn'];
    compat = LichessCompat.fromJson(json['compat']);
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fullId'] = fullId;
    data['gameId'] = gameId;
    data['fen'] = fen;
    data['color'] = color;
    data['lastMove'] = lastMove;
    data['source'] = source;
    data['variant'] = variant.toJson();
    data['speed'] = speed;
    data['perf'] = perf;
    data['rated'] = rated;
    data['hasMoved'] = hasMoved;
    data['opponent'] = opponent.toJson();
    data['isMyTurn'] = isMyTurn;
    data['compat'] = compat.toJson();
    data['id'] = id;
    return data;
  }
  
  @override
  String getGameId() {
    return gameId;
  }
}
