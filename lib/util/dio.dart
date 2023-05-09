import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

const connectionTimeout = Duration(seconds: 8);
const receivedTimeout = null;

const jsonDecoder = JsonDecoder();
final generalInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {
    log('request: ${options.uri}');
    return handler.next(options);
  },
  onResponse: (response, handler) {
    log('response: 【${response.data.runtimeType}】$response');
    return handler.next(response);
  },
  onError: (DioError e, handler) {
    log('error: ${e.message}');
    Get.snackbar('错误', e.message ?? '未知错误');
    // return handler.next(e);
  },
);
final dioTongZhong = Dio(BaseOptions(
  baseUrl: 'https://tonzhon.com/api',
  connectTimeout: connectionTimeout,
  receiveTimeout: receivedTimeout,
));
final dioMusicApi = Dio(BaseOptions(
  baseUrl: 'https://music-api.tonzhon.com',
  connectTimeout: connectionTimeout,
  receiveTimeout: receivedTimeout,
));

initDio() {
  dioTongZhong.interceptors.add(generalInterceptor);
  dioMusicApi.interceptors.add(generalInterceptor);
}
