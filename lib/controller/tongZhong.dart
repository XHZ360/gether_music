import 'dart:convert';

import 'package:gether_music/util/dio.dart';

import '../model/tongzhong_entity.dart';

Future<List<TongZhongSearchSongs>> searchSong(String keyword) async {
  final resFuzzy = dioTongZhong
      .get<TongzhongResponseEntity<TongZhongSearchEntity>>('/fuzzy_search',
          queryParameters: {'keyword': keyword});
  final resExact = dioTongZhong
      .get<TongzhongResponseEntity<TongZhongSearchEntity>>('/exact_search',
          queryParameters: {'keyword': keyword});
  final resQq = dioMusicApi
      .get<TongzhongResponseEntity<TongZhongApiSearchEntity>>('/search',
          queryParameters: {'keyword': keyword, 'platform': 'qq'});
  final resM = dioMusicApi
      .get<TongzhongResponseEntity<TongZhongApiSearchEntity>>('/search',
          queryParameters: {'keyword': keyword, 'platform': 'm'});
  final resNetEase = dioMusicApi
      .get<TongzhongResponseEntity<TongZhongApiSearchEntity>>('/search',
          queryParameters: {'keyword': keyword, 'platform': 'netease'});
  final resKuwo = dioMusicApi
      .get<TongzhongResponseEntity<TongZhongApiSearchEntity>>('/search',
          queryParameters: {'keyword': keyword, 'platform': 'kuwo'});

  final resAll2 = await Future.wait([
    resQq,
    resM,
    resNetEase,
    resKuwo,
  ]);
  final songs = [].cast<TongZhongSearchSongs>();

  addRes1(TongzhongResponseEntity<TongZhongSearchEntity> res1) {
    songs.addAll(res1.data.songs!);
  }

  addRes1((await resExact).data!);

  addRes2(TongzhongResponseEntity<TongZhongApiSearchEntity> res2) {
    songs.addAll(res2.data.data.songs);
  }

  for (var element in resAll2) {
    final data = element.data;
    // assert(element.data != null);
    assert(data != null);
    // addRes2(element.data);
    addRes2(data!);
  }

  addRes1((await resFuzzy).data!);
  return songs;
}

Future<String> getSongSource(TongzhongPlatform platform, String id) async {
  assert(platform != TongzhongPlatform.unknown);
  final res = await dioMusicApi.get<TongzhongResponseEntity<TongzhongSongEntity>>('/song_source/${platform.value}/$id');
  
  return res.data!.data.data.songSource;
}
