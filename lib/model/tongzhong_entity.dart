import 'package:json_annotation/json_annotation.dart';
part 'tongzhong_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TongzhongResponseEntity<T> {
  late bool success;
  late T data;

  TongzhongResponseEntity({required this.success, required this.data});

  factory TongzhongResponseEntity.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$TongzhongResponseEntityFromJson(json, fromJsonT);
}

// Tongzhong Search
@JsonSerializable()
class TongZhongSearchEntity {
  late List<TongZhongSearchSongs> songs;
  TongZhongSearchEntity({required this.songs});

  factory TongZhongSearchEntity.fromJson(Map<String, dynamic> json) =>
      _$TongZhongSearchEntityFromJson(json);
}

// Tongzhong Api Search
@JsonSerializable()
class TongZhongApiSearchEntity {
  late TongZongApiSearchDataEntity data;
  TongZhongApiSearchEntity({required this.data});

  factory TongZhongApiSearchEntity.fromJson(Map<String, dynamic> json) =>
      _$TongZhongApiSearchEntityFromJson(json);
}

@JsonSerializable()
class TongZongApiSearchDataEntity {
  late List<TongZhongSearchSongs> songs;
  TongZongApiSearchDataEntity({required this.songs});

  factory TongZongApiSearchDataEntity.fromJson(Map<String, dynamic> json) =>
      _$TongZongApiSearchDataEntityFromJson(json);
}

@JsonEnum(valueField: 'value')
enum TongzhongPlatform {
  qq('qq'),
  kuwo('kuwo'),
  netease('netease'),
  m('m'),
  unknown('unknown'),
  ;

  const TongzhongPlatform(this.value);
  final String value;
}

@JsonSerializable()
class TongZhongSearchSongs {
  dynamic originalId;
  String? newId;
  late String name;
  late TongzhongPlatform platform; //'qq' 'kuwo' 'netease'
  TongZhongSearchSongsAlbum? album;
  List<TongZhongSearchSongsArtists>? artists;
  String? alias;
  dynamic mvId;

  TongZhongSearchSongs({
    this.originalId,
    this.newId,
    required this.name,
    required this.platform,
    this.album,
    this.artists,
    this.alias,
    this.mvId,
  });

  factory TongZhongSearchSongs.fromJson(Map<String, dynamic> json) =>
      _$TongZhongSearchSongsFromJson(json);
}

@JsonSerializable()
class TongZhongSearchSongsAlbum {
  String? name;
  dynamic id;

  TongZhongSearchSongsAlbum({this.name, this.id});

  factory TongZhongSearchSongsAlbum.fromJson(Map<String, dynamic> json) =>
      _$TongZhongSearchSongsAlbumFromJson(json);
}

@JsonSerializable()
class TongZhongSearchSongsArtists {
  String? name;
  dynamic id;

  TongZhongSearchSongsArtists({this.name, this.id});

  factory TongZhongSearchSongsArtists.fromJson(Map<String, dynamic> json) =>
      _$TongZhongSearchSongsArtistsFromJson(json);
}

@JsonSerializable()
class TongzhongSongEntity {
  late TongzhongSongData data;
  TongzhongSongEntity({required this.data});

  factory TongzhongSongEntity.fromJson(Map<String, dynamic> json) =>
      _$TongzhongSongEntityFromJson(json);
}

@JsonSerializable()
class TongzhongSongData {
  late String songSource;

  TongzhongSongData({required this.songSource});

  factory TongzhongSongData.fromJson(Map<String, dynamic> json) =>
      _$TongzhongSongDataFromJson(json);
}
