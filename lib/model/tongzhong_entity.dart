import '../generated/json/base/json_convert_content.dart';
import '../generated/json/base/json_field.dart';

abstract class TongzhongResponseEntity {
  late bool success;
}

// Tongzhong Search
class TongZhongSearchEntity extends TongzhongResponseEntity
    with JsonConvert<TongZhongSearchEntity> {
  late List<TongZhongSearchSongs> songs;
}

// Tongzhogn Api Search
class TongZhongApiSearchEntity extends TongzhongResponseEntity
    with JsonConvert<TongZhongApiSearchEntity> {
  late TongZongApiSearchDataEntity data;
}

class TongZongApiSearchDataEntity
    with JsonConvert<TongZongApiSearchDataEntity> {
  late List<TongZhongSearchSongs> songs;
}

enum EnumTongzhongPlatform with JsonConvert<TongZongApiSearchDataEntity> {
  qq(value: 'qq'),
  kuwo(value: 'kuwo'),
  neteasy(value: 'neteasy'),
  unknown(value: "未知");

  const EnumTongzhongPlatform({required this.value});
  final String value;
  factory EnumTongzhongPlatform.fromStr(String value) {
    switch (value) {
      case 'qq':
        return EnumTongzhongPlatform.qq;
      case 'kuwo':
        return EnumTongzhongPlatform.kuwo;
      case 'neteasy':
        return EnumTongzhongPlatform.neteasy;
      default:
        return EnumTongzhongPlatform.unknown;
    }
  }
  @override
  toString() {
    return value;
  }
}

class TongZhongSearchSongs with JsonConvert<TongZhongSearchSongs> {
  String? originalId;
  String? newId;
  late String name;
  late EnumTongzhongPlatform platform;
  TongZhongSearchSongsAlbum? album;
  List<TongZhongSearchSongsArtists>? artists;
  String? alias;
  String? mvId;
}

class TongZhongSearchSongsAlbum with JsonConvert<TongZhongSearchSongsAlbum> {
  String? name;
  String? id;
}

class TongZhongSearchSongsArtists
    with JsonConvert<TongZhongSearchSongsArtists> {
  String? name;
  String? id;
}

class TongzhongSongEntity extends TongzhongResponseEntity
    with JsonConvert<TongzhongSongEntity> {
  late TongzhongSongData data;
}

class TongzhongSongData with JsonConvert<TongzhongSongEntity> {
  late String songSource;
}
