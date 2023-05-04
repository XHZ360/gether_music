import 'package:gether_music/generated/json/base/json_convert_content.dart';
import 'package:gether_music/model/tongzhong_search_v2_entity.dart';

TongzhongSearchV2Entity $TongzhongSearchV2EntityFromJson(Map<String, dynamic> json) {
	final TongzhongSearchV2Entity tongzhongSearchV2Entity = TongzhongSearchV2Entity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		tongzhongSearchV2Entity.success = success;
	}
	final TongzhongSearchV2Data? data = jsonConvert.convert<TongzhongSearchV2Data>(json['data']);
	if (data != null) {
		tongzhongSearchV2Entity.data = data;
	}
	return tongzhongSearchV2Entity;
}

Map<String, dynamic> $TongzhongSearchV2EntityToJson(TongzhongSearchV2Entity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['data'] = entity.data?.toJson();
	return data;
}

TongzhongSearchV2Data $TongzhongSearchV2DataFromJson(Map<String, dynamic> json) {
	final TongzhongSearchV2Data tongzhongSearchV2Data = TongzhongSearchV2Data();
	final List<TongzhongSearchV2DataSongs>? songs = jsonConvert.convertListNotNull<TongzhongSearchV2DataSongs>(json['songs']);
	if (songs != null) {
		tongzhongSearchV2Data.songs = songs;
	}
	return tongzhongSearchV2Data;
}

Map<String, dynamic> $TongzhongSearchV2DataToJson(TongzhongSearchV2Data entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['songs'] =  entity.songs?.map((v) => v.toJson()).toList();
	return data;
}

TongzhongSearchV2DataSongs $TongzhongSearchV2DataSongsFromJson(Map<String, dynamic> json) {
	final TongzhongSearchV2DataSongs tongzhongSearchV2DataSongs = TongzhongSearchV2DataSongs();
	final int? originalId = jsonConvert.convert<int>(json['originalId']);
	if (originalId != null) {
		tongzhongSearchV2DataSongs.originalId = originalId;
	}
	final String? newId = jsonConvert.convert<String>(json['newId']);
	if (newId != null) {
		tongzhongSearchV2DataSongs.newId = newId;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		tongzhongSearchV2DataSongs.name = name;
	}
	final String? alias = jsonConvert.convert<String>(json['alias']);
	if (alias != null) {
		tongzhongSearchV2DataSongs.alias = alias;
	}
	final String? mvId = jsonConvert.convert<String>(json['mvId']);
	if (mvId != null) {
		tongzhongSearchV2DataSongs.mvId = mvId;
	}
	final List<TongzhongSearchV2DataSongsArtists>? artists = jsonConvert.convertListNotNull<TongzhongSearchV2DataSongsArtists>(json['artists']);
	if (artists != null) {
		tongzhongSearchV2DataSongs.artists = artists;
	}
	final TongzhongSearchV2DataSongsAlbum? album = jsonConvert.convert<TongzhongSearchV2DataSongsAlbum>(json['album']);
	if (album != null) {
		tongzhongSearchV2DataSongs.album = album;
	}
	final String? platform = jsonConvert.convert<String>(json['platform']);
	if (platform != null) {
		tongzhongSearchV2DataSongs.platform = platform;
	}
	return tongzhongSearchV2DataSongs;
}

Map<String, dynamic> $TongzhongSearchV2DataSongsToJson(TongzhongSearchV2DataSongs entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['originalId'] = entity.originalId;
	data['newId'] = entity.newId;
	data['name'] = entity.name;
	data['alias'] = entity.alias;
	data['mvId'] = entity.mvId;
	data['artists'] =  entity.artists?.map((v) => v.toJson()).toList();
	data['album'] = entity.album?.toJson();
	data['platform'] = entity.platform;
	return data;
}

TongzhongSearchV2DataSongsArtists $TongzhongSearchV2DataSongsArtistsFromJson(Map<String, dynamic> json) {
	final TongzhongSearchV2DataSongsArtists tongzhongSearchV2DataSongsArtists = TongzhongSearchV2DataSongsArtists();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		tongzhongSearchV2DataSongsArtists.name = name;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		tongzhongSearchV2DataSongsArtists.id = id;
	}
	return tongzhongSearchV2DataSongsArtists;
}

Map<String, dynamic> $TongzhongSearchV2DataSongsArtistsToJson(TongzhongSearchV2DataSongsArtists entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['id'] = entity.id;
	return data;
}

TongzhongSearchV2DataSongsAlbum $TongzhongSearchV2DataSongsAlbumFromJson(Map<String, dynamic> json) {
	final TongzhongSearchV2DataSongsAlbum tongzhongSearchV2DataSongsAlbum = TongzhongSearchV2DataSongsAlbum();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		tongzhongSearchV2DataSongsAlbum.name = name;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		tongzhongSearchV2DataSongsAlbum.id = id;
	}
	return tongzhongSearchV2DataSongsAlbum;
}

Map<String, dynamic> $TongzhongSearchV2DataSongsAlbumToJson(TongzhongSearchV2DataSongsAlbum entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['id'] = entity.id;
	return data;
}