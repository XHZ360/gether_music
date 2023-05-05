import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:gether_music/component/bottom_player.dart';
import 'package:gether_music/controller/global_player.dart';
import 'package:gether_music/model/tong_zhong_search_entity.dart';
import 'package:just_audio/just_audio.dart';

import '../../controller/TongZhong.dart';

class SearchPage extends StatefulWidget {
  final String initKeyword;
  const SearchPage({super.key, this.initKeyword = ''});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String keyword = '';
  final controller = Get.find<GloablPlayerController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyword = widget.initKeyword;
  }

  var songList = Future.value([].cast<TongZhongSearchSongs>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _buildSearchInput(),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: () {
                  switch (keyword.trim()) {
                    case '':
                      return const Placeholder();
                    default:
                      return FutureBuilder(
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return snapshot.data!.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        var item = snapshot.data![index];
                                        final artist = item!.artists!.isNotEmpty
                                            ? item!.artists![0].name ?? '未知'
                                            : '未知';

                                        return ListTile(
                                          title: Text(item.name!),
                                          subtitle:
                                              Text('【${item.platform}】$artist'),
                                          onTap: () async {
                                            var id = item.originalId ??
                                                item.newId!.substring(1);
                                            final url = await getSongSource(
                                                item.platform!,
                                                id);
                                            controller.playList.add(Song(
                                                name: item.name!,
                                                singer: artist,
                                                url: url));
                                            log('add song ${item.name}');
                                          },
                                        );
                                      })
                                  : const Center(child: Text('没有找到相关歌曲'));
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                          future: songList);
                  }
                }()),
          ),
          BottomPlayer()
        ],
      ),
    ));
  }

  final searchController = TextEditingController();
  _buildSearchInput() {
    searchController.text = keyword;
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            controller: searchController,
            onSubmitted: (value) {
              keyword = value;
              search();
            },
            onChanged: (value) => {
              keyword = value,
            },
          ),
        ),
        IconButton(onPressed: search, icon: const Icon(Icons.search))
      ],
    );
  }

  search() {
    if (keyword.trim() == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('请输入搜索关键字')));
      return;
    } else {
      setState(() {
        songList = searchSong(keyword);
      });
    }
  }
}
