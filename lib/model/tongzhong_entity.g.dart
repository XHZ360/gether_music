// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tongzhong_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TongzhongResponseEntity<T> _$TongzhongResponseEntityFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TongzhongResponseEntity<T>(
      success: json['success'] as bool,
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$TongzhongResponseEntityToJson<T>(
  TongzhongResponseEntity<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'data': toJsonT(instance.data),
    };

TongZhongSearchEntity _$TongZhongSearchEntityFromJson(
        Map<String, dynamic> json) =>
    TongZhongSearchEntity(
      songs: (json['songs'] as List<dynamic>)
          .map((e) => TongZhongSearchSongs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TongZhongSearchEntityToJson(
        TongZhongSearchEntity instance) =>
    <String, dynamic>{
      'songs': instance.songs,
    };

TongZhongApiSearchEntity _$TongZhongApiSearchEntityFromJson(
        Map<String, dynamic> json) =>
    TongZhongApiSearchEntity(
      data: TongZongApiSearchDataEntity.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TongZhongApiSearchEntityToJson(
        TongZhongApiSearchEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

TongZongApiSearchDataEntity _$TongZongApiSearchDataEntityFromJson(
        Map<String, dynamic> json) =>
    TongZongApiSearchDataEntity(
      songs: (json['songs'] as List<dynamic>)
          .map((e) => TongZhongSearchSongs.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TongZongApiSearchDataEntityToJson(
        TongZongApiSearchDataEntity instance) =>
    <String, dynamic>{
      'songs': instance.songs,
    };

TongZhongSearchSongs _$TongZhongSearchSongsFromJson(
        Map<String, dynamic> json) =>
    TongZhongSearchSongs(
      originalId: json['originalId'],
      newId: json['newId'] as String?,
      name: json['name'] as String,
      platform: $enumDecode(_$TongzhongPlatformEnumMap, json['platform']),
      album: json['album'] == null
          ? null
          : TongZhongSearchSongsAlbum.fromJson(
              json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) =>
              TongZhongSearchSongsArtists.fromJson(e as Map<String, dynamic>))
          .toList(),
      alias: json['alias'] as String?,
      mvId: json['mvId'],
    );

Map<String, dynamic> _$TongZhongSearchSongsToJson(
        TongZhongSearchSongs instance) =>
    <String, dynamic>{
      'originalId': instance.originalId,
      'newId': instance.newId,
      'name': instance.name,
      'platform': _$TongzhongPlatformEnumMap[instance.platform]!,
      'album': instance.album,
      'artists': instance.artists,
      'alias': instance.alias,
      'mvId': instance.mvId,
    };

const _$TongzhongPlatformEnumMap = {
  TongzhongPlatform.qq: 'qq',
  TongzhongPlatform.kuwo: 'kuwo',
  TongzhongPlatform.netease: 'netease',
  TongzhongPlatform.m: 'm',
  TongzhongPlatform.unknown: 'unknown',
};

TongZhongSearchSongsAlbum _$TongZhongSearchSongsAlbumFromJson(
        Map<String, dynamic> json) =>
    TongZhongSearchSongsAlbum(
      name: json['name'] as String?,
      id: json['id'],
    );

Map<String, dynamic> _$TongZhongSearchSongsAlbumToJson(
        TongZhongSearchSongsAlbum instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

TongZhongSearchSongsArtists _$TongZhongSearchSongsArtistsFromJson(
        Map<String, dynamic> json) =>
    TongZhongSearchSongsArtists(
      name: json['name'] as String?,
      id: json['id'],
    );

Map<String, dynamic> _$TongZhongSearchSongsArtistsToJson(
        TongZhongSearchSongsArtists instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

TongzhongSongEntity _$TongzhongSongEntityFromJson(Map<String, dynamic> json) =>
    TongzhongSongEntity(
      data: TongzhongSongData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TongzhongSongEntityToJson(
        TongzhongSongEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

TongzhongSongData _$TongzhongSongDataFromJson(Map<String, dynamic> json) =>
    TongzhongSongData(
      songSource: json['songSource'] as String,
    );

Map<String, dynamic> _$TongzhongSongDataToJson(TongzhongSongData instance) =>
    <String, dynamic>{
      'songSource': instance.songSource,
    };
