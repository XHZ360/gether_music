import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gether_music/controller/const.dart';
import 'package:gether_music/controller/global_player.dart';
import 'package:just_audio/just_audio.dart';

class BottomPlayer extends StatelessWidget {
  BottomPlayer({super.key});
  final controller = Get.find<GloablPlayerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: pagePd,
        height: 100,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // 歌曲信息
            StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  var currentSong = controller.playList[snapshot.data!];
                  return Text('${currentSong.name}-${currentSong.singer}');
                } else {
                  return const Text('未知');
                }
              },
              stream: controller.player.currentIndexStream,
            ),
            // 进度条
            ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 10),
              child: StreamBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          color: Theme.of(context).disabledColor,
                        ),
                        // 缓冲进度
                        FractionallySizedBox(
                          widthFactor: snapshot.data!.duration.inSeconds != 0
                              ? snapshot.data!.buffered.inSeconds /
                                  snapshot.data!.duration.inSeconds
                              : 0,
                          child: Container(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        // 播放进度
                        ConstrainedBox(
                          constraints: const BoxConstraints.expand(),
                          child: CupertinoSlider(
                              value: snapshot.data!.duration.inSeconds != 0
                                  ? snapshot.data!.position.inSeconds /
                                      snapshot.data!.duration.inSeconds
                                  : 0,
                              onChanged: (value) {
                                if (snapshot.data!.duration.inSeconds != 0) {
                                  controller.player.seek(Duration(
                                      seconds:
                                          (snapshot.data!.duration.inSeconds *
                                                  value)
                                              .toInt()));
                                }
                              }),
                        )
                      ],
                    );
                  } else {
                    return const SizedBox(
                      height: 1,
                    );
                  }
                },
                stream: controller.positionStream,
              ),
            ),
            // 控制按钮
            ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 40),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  StreamBuilder(
                    builder: (context, snapdata) {
                      final enablePrevious = controller.player.hasPrevious;
                      final enableNext = controller.player.hasNext;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: enablePrevious
                                ? () {
                                    controller.player.seekToPrevious();
                                  }
                                : null,
                            icon: const Icon(Icons.skip_previous),
                          ),
                          Obx(() => IconButton(onPressed: () {
                                switch (controller.status.value) {
                                  case EnumPlayStatus.pause:
                                    controller.status.value =
                                        EnumPlayStatus.playing;
                                    break;
                                  case EnumPlayStatus.playing:
                                    controller.status.value =
                                        EnumPlayStatus.pause;
                                    break;
                                  default:
                                    break;
                                }
                              }, icon: () {
                                switch (controller.status.value) {
                                  case EnumPlayStatus.pause:
                                    return const Icon(Icons.play_arrow);
                                  case EnumPlayStatus.playing:
                                    return const Icon(Icons.pause);
                                  default:
                                    return Icon(Icons.play_arrow,
                                        color: Theme.of(context).disabledColor);
                                }
                              }())),
                          IconButton(
                            onPressed: enableNext
                                ? () {
                                    controller.player.seekToNext();
                                  }
                                : null,
                            icon: const Icon(Icons.skip_next),
                          )
                        ],
                      );
                    },
                    stream: controller.player.currentIndexStream,
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return PlayListSheet();
                              });
                        },
                        icon: const Icon(Icons.list)),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class PlayListSheet extends StatelessWidget {
  PlayListSheet({super.key});
  final controller = Get.find<GloablPlayerController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
            for (var song in controller.playList.asMap().entries)
              ListTile(
                title: Text(song.value.name),
                subtitle: Text(song.value.singer),
                onTap: () {
                  controller.player.seek(
                    Duration.zero,
                    index: song.key,
                  );
                },
              )
          ],
        ));
  }
}
