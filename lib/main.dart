import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gether_music/controller/global_player.dart';
import 'package:gether_music/pages/search/index.dart';
import 'package:just_audio/just_audio.dart';

import 'controller/TongZhong.dart';
import 'util/dio.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initDio();
  Get.put(GloablPlayerController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gether Music',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: const SearchPage(),
    );
  }
}
