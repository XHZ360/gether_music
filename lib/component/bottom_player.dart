import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';

class BottomPlayer extends StatefulWidget {
  const BottomPlayer({super.key, required this.player});
  final AudioPlayer player;

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  var expandPlayerList = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          widget.player.seek(Duration(
                              seconds: widget.player.position.inSeconds - 10));
                        },
                        icon: const Icon(Icons.skip_previous)),
                    IconButton(
                        onPressed: () {
                          widget.player.play();
                        },
                        icon: const Icon(Icons.play_arrow)),
                    IconButton(
                        onPressed: () {
                          widget.player.pause();
                        },
                        icon: const Icon(Icons.pause)),
                    IconButton(
                        onPressed: () {
                          widget.player.seek(Duration(
                              seconds: widget.player.position.inSeconds + 10));
                        },
                        icon: const Icon(Icons.skip_next))
                  ],
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        expandPlayerList = !expandPlayerList;
                      });
                    },
                    icon: const Icon(Icons.list)),
              ],
            ),
          ],
        ));
  }
}
