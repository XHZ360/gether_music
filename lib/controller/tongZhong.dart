import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gether_music/util/dio.dart';

import '../model/tongzhong_entity.dart';

Future<List<TongZhongSearchSongs>> searchSong(String keyword) async {
  final resFuzzy = dioTongZhong
      .get('/fuzzy_search',
          queryParameters: {'keyword': keyword});
  final resExact = dioTongZhong
      .get('/exact_search',
          queryParameters: {'keyword': keyword});
  final resQq = dioMusicApi
      .get('/search',
          queryParameters: {'keyword': keyword, 'platform': 'qq'});
  final resM = dioMusicApi
      .get('/search',
          queryParameters: {'keyword': keyword, 'platform': 'm'});
  final resNetEase = dioMusicApi
      .get('/search',
          queryParameters: {'keyword': keyword, 'platform': 'netease'});
  final resKuwo = dioMusicApi
      .get('/search',
          queryParameters: {'keyword': keyword, 'platform': 'kuwo'});

  final resAll2 = await Future.wait([
    resQq,
    resM,
    resNetEase,
    resKuwo,
  ]);
  final songs = [].cast<TongZhongSearchSongs>();

  addRes1(Response res1) {
    songs.addAll(TongZhongSearchEntity.fromJson(res1.data).songs);
  }

  addRes1((await resExact));

  addRes2(Response res2) {
    songs.addAll(TongZhongApiSearchEntity.fromJson(res2.data).data.songs);
  }

  for (var element in resAll2) {
    assert(element.data != null);
    addRes2(element);
  }

  addRes1((await resFuzzy));
  return songs;
}

Future<String> getSongSource(TongzhongPlatform platform, String id) async {
  assert(platform != TongzhongPlatform.unknown);
  final res = await dioMusicApi.get('/song_source/${platform.value}/$id');
  
  return TongzhongSongEntity.fromJson(res.data).data.songSource;
}
