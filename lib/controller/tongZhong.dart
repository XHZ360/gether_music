import 'dart:convert';

import 'package:gether_music/model/tongzhong_search_v2_entity.dart';
import 'package:gether_music/util/dio.dart';

import '../model/tong_zhong_search_entity.dart';

Future<List<TongZhongSearchSongs>> searchSong(String keyword) async {
  final resFuzzy =
      dioTongZhong.get('/fuzzy_search', queryParameters: {'keyword': keyword});
  final resExact =
      dioTongZhong.get('/exact_search', queryParameters: {'keyword': keyword});
  final resQq = dioMusicApi
      .get('/search', queryParameters: {'keyword': keyword, 'platform': 'qq'});
  final resM = dioMusicApi
      .get('/search', queryParameters: {'keyword': keyword, 'platform': 'm'});
  final resNetEase = dioMusicApi.get('/search',
      queryParameters: {'keyword': keyword, 'platform': 'netease'});
  final resKuwo = dioMusicApi.get('/search',
      queryParameters: {'keyword': keyword, 'platform': 'kuwo'});

  final resAll2 = await Future.wait([
    resQq,
    resM,
    resNetEase,
    resKuwo,
  ]);
  final songs = [].cast<TongZhongSearchSongs>();

  addRes1(res1) {
    final entity = TongZhongSearchEntity.fromJson(res1.data!);
    songs.addAll(entity.songs!);
  }

  addRes1(await resExact);

  addRes2(res2) {
    final entity = TongzhongSearchV2Entity.fromJson(res2.data!);
    songs.addAll(entity.data!.songs!
        .map((e) => TongZhongSearchSongs.fromJson(Map.of(e.toJson()))));
  }

  for (var element in resAll2) {
    addRes2(element);
  }

  addRes1(await resFuzzy);
  return songs;
}
