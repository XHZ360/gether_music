import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gether_music/controller/global_player.dart';
import 'package:just_audio/just_audio.dart';

class BottomPlayer extends StatelessWidget {
  BottomPlayer({super.key});
  final controller = Get.find<GloablPlayerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        color: Colors.white,
        child: Obx(() => Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.skip_previous)),
                        IconButton(onPressed: () {
                          switch (controller.status.value) {
                            case EnumPlayStatus.pause:
                              controller.status.value = EnumPlayStatus.playing;
                              break;
                            case EnumPlayStatus.playing:
                              controller.status.value = EnumPlayStatus.pause;
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
                              return const Icon(Icons.play_arrow,
                                  color: Colors.grey);
                          }
                        }()),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.skip_next))
                      ],
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
                  ],
                ),
              ],
            )));
  }
}
