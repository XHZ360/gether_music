import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class Song {
  final String name;
  final String singer;
  final String url;
  final String? cover;
  Song(
      {required this.name,
      required this.singer,
      required this.url,
      this.cover});
}

enum EnumPlayStatus {
  playing,
  pause,
  stop,
}

class GloablPlayerController extends GetxController {
  final _player = AudioPlayer();
  final playList = <Song>[].obs;
  final status = EnumPlayStatus.stop.obs;
  var currentSong = Rx<Song?>(null);
  var order = LoopMode.all.obs;
  @override
  void onInit() {
    // 更改order，同步更新_player LoopMode
    ever(order, (callback) async {
      await _player.setLoopMode(callback);
    });

    // 更改playList, 更新PlayerAudioSouce
    ever(playList, (callback) async {
      var validPlayList = <Song>[];
      var audioSouceList = <AudioSource>[];
      for (var song in playList) {
        if (song.url != null) {
          try {
            var url = Uri.parse(song.url);
            validPlayList.add(song);
            audioSouceList.add(AudioSource.uri(url));
          } catch (e) {
            log(e.toString() + song.url);
          }
        }
      }
      await _player
          .setAudioSource(ConcatenatingAudioSource(children: audioSouceList));
      callback = validPlayList;
      if (playList.isNotEmpty && status.value == EnumPlayStatus.stop) {
        status.value = EnumPlayStatus.pause;
      }
    });
    // 更改status，对player进行操作
    ever(
        status,
        (callback) async => {
              if (callback == EnumPlayStatus.playing)
                {await _player.play()}
              else if (callback == EnumPlayStatus.pause)
                {await _player.pause()}
              else if (callback == EnumPlayStatus.stop)
                {await _player.stop()}
            });

    _player.currentIndexStream.listen((event) {
      if (event != null) {
        currentSong.value = playList[event];
        log('change current song to $event');
      }
    });

    // TODO: implement onInit
    super.onInit();
  }
}
