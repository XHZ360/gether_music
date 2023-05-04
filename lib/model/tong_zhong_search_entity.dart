import 'package:gether_music/generated/json/base/json_field.dart';
import 'package:gether_music/generated/json/tong_zhong_search_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TongZhongSearchEntity {
	bool? success;
	List<TongZhongSearchSongs>? songs;

	TongZhongSearchEntity();

	factory TongZhongSearchEntity.fromJson(Map<String, dynamic> json) => $TongZhongSearchEntityFromJson(json);

	Map<String, dynamic> toJson() => $TongZhongSearchEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TongZhongSearchSongs {
	String? originalId;
	String? newId;
	String? name;
	String? platform;
	TongZhongSearchSongsAlbum? album;
	List<TongZhongSearchSongsArtists>? artists;
	String? alias;
	String? mvId;

	TongZhongSearchSongs();

	factory TongZhongSearchSongs.fromJson(Map<String, dynamic> json) => $TongZhongSearchSongsFromJson(json);

	Map<String, dynamic> toJson() => $TongZhongSearchSongsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TongZhongSearchSongsAlbum {
	String? name;
	String? id;

	TongZhongSearchSongsAlbum();

	factory TongZhongSearchSongsAlbum.fromJson(Map<String, dynamic> json) => $TongZhongSearchSongsAlbumFromJson(json);

	Map<String, dynamic> toJson() => $TongZhongSearchSongsAlbumToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TongZhongSearchSongsArtists {
	@JSONField(name: "_id")
	String? sId;
	String? name;
	String? id;

	TongZhongSearchSongsArtists();

	factory TongZhongSearchSongsArtists.fromJson(Map<String, dynamic> json) => $TongZhongSearchSongsArtistsFromJson(json);

	Map<String, dynamic> toJson() => $TongZhongSearchSongsArtistsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}