import 'package:gether_music/generated/json/base/json_convert_content.dart';
import 'package:gether_music/model/tong_zhong_search_entity.dart';

TongZhongSearchEntity $TongZhongSearchEntityFromJson(Map<String, dynamic> json) {
	final TongZhongSearchEntity tongZhongSearchEntity = TongZhongSearchEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		tongZhongSearchEntity.success = success;
	}
	final List<TongZhongSearchSongs>? songs = jsonConvert.convertListNotNull<TongZhongSearchSongs>(json['songs']);
	if (songs != null) {
		tongZhongSearchEntity.songs = songs;
	}
	return tongZhongSearchEntity;
}

Map<String, dynamic> $TongZhongSearchEntityToJson(TongZhongSearchEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['songs'] =  entity.songs?.map((v) => v.toJson()).toList();
	return data;
}

TongZhongSearchSongs $TongZhongSearchSongsFromJson(Map<String, dynamic> json) {
	final TongZhongSearchSongs tongZhongSearchSongs = TongZhongSearchSongs();
	final String? originalId = jsonConvert.convert<String>(json['originalId']);
	if (originalId != null) {
		tongZhongSearchSongs.originalId = originalId;
	}
	final String? newId = jsonConvert.convert<String>(json['newId']);
	if (newId != null) {
		tongZhongSearchSongs.newId = newId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		tongZhongSearchSongs.name = name;
	}
	final String? platform = jsonConvert.convert<String>(json['platform']);
	if (platform != null) {
		tongZhongSearchSongs.platform = platform;
	}
	final TongZhongSearchSongsAlbum? album = jsonConvert.convert<TongZhongSearchSongsAlbum>(json['album']);
	if (album != null) {
		tongZhongSearchSongs.album = album;
	}
	final List<TongZhongSearchSongsArtists>? artists = jsonConvert.convertListNotNull<TongZhongSearchSongsArtists>(json['artists']);
	if (artists != null) {
		tongZhongSearchSongs.artists = artists;
	}
	final String? alias = jsonConvert.convert<String>(json['alias']);
	if (alias != null) {
		tongZhongSearchSongs.alias = alias;
	}
	final String? mvId = jsonConvert.convert<String>(json['mvId']);
	if (mvId != null) {
		tongZhongSearchSongs.mvId = mvId;
	}
	return tongZhongSearchSongs;
}

Map<String, dynamic> $TongZhongSearchSongsToJson(TongZhongSearchSongs entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['originalId'] = entity.originalId;
	data['newId'] = entity.newId;
	data['name'] = entity.name;
	data['platform'] = entity.platform;
	data['album'] = entity.album?.toJson();
	data['artists'] =  entity.artists?.map((v) => v.toJson()).toList();
	data['alias'] = entity.alias;
	data['mvId'] = entity.mvId;
	return data;
}

TongZhongSearchSongsAlbum $TongZhongSearchSongsAlbumFromJson(Map<String, dynamic> json) {
	final TongZhongSearchSongsAlbum tongZhongSearchSongsAlbum = TongZhongSearchSongsAlbum();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		tongZhongSearchSongsAlbum.name = name;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		tongZhongSearchSongsAlbum.id = id;
	}
	return tongZhongSearchSongsAlbum;
}

Map<String, dynamic> $TongZhongSearchSongsAlbumToJson(TongZhongSearchSongsAlbum entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['id'] = entity.id;
	return data;
}

TongZhongSearchSongsArtists $TongZhongSearchSongsArtistsFromJson(Map<String, dynamic> json) {
	final TongZhongSearchSongsArtists tongZhongSearchSongsArtists = TongZhongSearchSongsArtists();
	final String? sId = jsonConvert.convert<String>(json['_id']);
	if (sId != null) {
		tongZhongSearchSongsArtists.sId = sId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		tongZhongSearchSongsArtists.name = name;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		tongZhongSearchSongsArtists.id = id;
	}
	return tongZhongSearchSongsArtists;
}

Map<String, dynamic> $TongZhongSearchSongsArtistsToJson(TongZhongSearchSongsArtists entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	data['id'] = entity.id;
	return data;
}