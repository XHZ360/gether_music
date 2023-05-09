import 'dart:async';
import 'dart:developer';

import 'package:audio_session/audio_session.dart';
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
  final player = AudioPlayer();
  final playList = <Song>[].obs;
  final _status = EnumPlayStatus.stop.obs;
  get status => _status;
  Stream<PositionedData> get positionStream {
    var positionedData = PositionedData(
        position: 0.seconds, duration: 0.seconds, buffered: 0.seconds);
    var controller = StreamController<PositionedData>();
    player.positionStream.listen((event) {
      positionedData.position = event;
      controller.add(positionedData);
    });
    player.bufferedPositionStream.listen((event) {
      positionedData.buffered = event;
      controller.add(positionedData);
    });
    player.durationStream.listen((event) {
      positionedData.duration = event ?? 0.seconds;
      controller.add(positionedData);
    });
    return controller.stream;
  }

  @override
  void onInit() {
    log('init');
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
      await player
          .setAudioSource(ConcatenatingAudioSource(children: audioSouceList));
      callback = validPlayList;
      if (playList.isNotEmpty && status.value == EnumPlayStatus.stop) {
        status.value = EnumPlayStatus.pause;
      }
    });
    ever(status, (callback) {
      log('$callback');
      switch (status.value) {
        case EnumPlayStatus.playing:
          player.play();
          break;
        case EnumPlayStatus.pause:
          player.pause();
          break;
        case EnumPlayStatus.stop:
          player.stop();
          break;
        default:
          log('unknown status');
      }
    });
    _init();
    super.onInit();
  }

  _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    // Listen to errors during playback.
    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      log('A stream error occurred: $e');
    });
  }
}

class PositionedData {
  Duration position;
  Duration duration;
  Duration buffered;
  PositionedData(
      {required this.position, required this.duration, required this.buffered});
}
