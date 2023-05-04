import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';

class BottomPlayer extends StatelessWidget {
  final AudioPlayer player;
  const BottomPlayer({super.key, required this.player});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                player.seek(Duration(seconds: player.position.inSeconds - 10));
              },
              icon: const Icon(Icons.skip_previous)),
          IconButton(
              onPressed: () {
                player.play();
              },
              icon: const Icon(Icons.play_arrow)),
          IconButton(
              onPressed: () {
                player.pause();
              },
              icon: const Icon(Icons.pause)),
          IconButton(
              onPressed: () {
                player.seek(Duration(seconds: player.position.inSeconds + 10));
              },
              icon: const Icon(Icons.skip_next)),
        ],
      ),
    );
  }
}
