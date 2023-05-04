import 'package:gether_music/generated/json/base/json_field.dart';
import 'package:gether_music/generated/json/tongzhong_search_v2_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TongzhongSearchV2Entity {
	bool? success;
	TongzhongSearchV2Data? data;

	TongzhongSearchV2Entity();

	factory TongzhongSearchV2Entity.fromJson(Map<String, dynamic> json) => $TongzhongSearchV2EntityFromJson(json);

	Map<String, dynamic> toJson() => $TongzhongSearchV2EntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TongzhongSearchV2Data {
	List<TongzhongSearchV2DataSongs>? songs;

	TongzhongSearchV2Data();

	factory TongzhongSearchV2Data.fromJson(Map<String, dynamic> json) => $TongzhongSearchV2DataFromJson(json);

	Map<String, dynamic> toJson() => $TongzhongSearchV2DataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TongzhongSearchV2DataSongs {
	int? originalId;
	String? newId;
	String? name;
	String? alias;
	String? mvId;
	List<TongzhongSearchV2DataSongsArtists>? artists;
	TongzhongSearchV2DataSongsAlbum? album;
	String? platform;

	TongzhongSearchV2DataSongs();

	factory TongzhongSearchV2DataSongs.fromJson(Map<String, dynamic> json) => $TongzhongSearchV2DataSongsFromJson(json);

	Map<String, dynamic> toJson() => $TongzhongSearchV2DataSongsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TongzhongSearchV2DataSongsArtists {
	String? name;
	int? id;

	TongzhongSearchV2DataSongsArtists();

	factory TongzhongSearchV2DataSongsArtists.fromJson(Map<String, dynamic> json) => $TongzhongSearchV2DataSongsArtistsFromJson(json);

	Map<String, dynamic> toJson() => $TongzhongSearchV2DataSongsArtistsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TongzhongSearchV2DataSongsAlbum {
	String? name;
	int? id;

	TongzhongSearchV2DataSongsAlbum();

	factory TongzhongSearchV2DataSongsAlbum.fromJson(Map<String, dynamic> json) => $TongzhongSearchV2DataSongsAlbumFromJson(json);

	Map<String, dynamic> toJson() => $TongzhongSearchV2DataSongsAlbumToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}