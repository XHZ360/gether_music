import 'package:gether_music/model/tongzhong_entity.dart';

tongZhongSearchEntityFromJson(TongZhongSearchEntity data, Map<String, dynamic> json) {
	if (json['songs'] != null) {
		data.songs = (json['songs'] as List).map((v) => TongZhongSearchSongs().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> tongZhongSearchEntityToJson(TongZhongSearchEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['songs'] =  entity.songs.map((v) => v.toJson()).toList();
	return data;
}

tongZhongApiSearchEntityFromJson(TongZhongApiSearchEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = TongZongApiSearchDataEntity().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> tongZhongApiSearchEntityToJson(TongZhongApiSearchEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] = entity.data.toJson();
	return data;
}

tongZongApiSearchDataEntityFromJson(TongZongApiSearchDataEntity data, Map<String, dynamic> json) {
	if (json['songs'] != null) {
		data.songs = (json['songs'] as List).map((v) => TongZhongSearchSongs().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> tongZongApiSearchDataEntityToJson(TongZongApiSearchDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['songs'] =  entity.songs.map((v) => v.toJson()).toList();
	return data;
}

tongZhongSearchSongsFromJson(TongZhongSearchSongs data, Map<String, dynamic> json) {
	if (json['originalId'] != null) {
		data.originalId = json['originalId'].toString();
	}
	if (json['newId'] != null) {
		data.newId = json['newId'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['platform'] != null) {
		final platStr = json['platform'];
		assert(platStr is String);
		assert(platStr == 'qq' || platStr == 'kuwo' || platStr == 'neteasy');
		data.platform = EnumTongzhongPlatform.fromStr(json['platform']);
	}
	if (json['album'] != null) {
		data.album = TongZhongSearchSongsAlbum().fromJson(json['album']);
	}
	if (json['artists'] != null) {
		data.artists = (json['artists'] as List).map((v) => TongZhongSearchSongsArtists().fromJson(v)).toList();
	}
	if (json['alias'] != null) {
		data.alias = json['alias'].toString();
	}
	if (json['mvId'] != null) {
		data.mvId = json['mvId'].toString();
	}
	return data;
}

Map<String, dynamic> tongZhongSearchSongsToJson(TongZhongSearchSongs entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['originalId'] = entity.originalId;
	data['newId'] = entity.newId;
	data['name'] = entity.name;
	data['platform'] = entity.platform.toJson();
	data['album'] = entity.album?.toJson();
	data['artists'] =  entity.artists?.map((v) => v.toJson())?.toList();
	data['alias'] = entity.alias;
	data['mvId'] = entity.mvId;
	return data;
}

tongZhongSearchSongsAlbumFromJson(TongZhongSearchSongsAlbum data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> tongZhongSearchSongsAlbumToJson(TongZhongSearchSongsAlbum entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	return data;
}

tongZhongSearchSongsArtistsFromJson(TongZhongSearchSongsArtists data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	return data;
}

Map<String, dynamic> tongZhongSearchSongsArtistsToJson(TongZhongSearchSongsArtists entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['id'] = entity.id;
	return data;
}

tongzhongSongEntityFromJson(TongzhongSongEntity data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = TongzhongSongData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> tongzhongSongEntityToJson(TongzhongSongEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['data'] = entity.data.toJson();
	return data;
}

tongzhongSongDataFromJson(TongzhongSongData data, Map<String, dynamic> json) {
	if (json['songSource'] != null) {
		data.songSource = json['songSource'].toString();
	}
	return data;
}

Map<String, dynamic> tongzhongSongDataToJson(TongzhongSongData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['songSource'] = entity.songSource;
	return data;
}