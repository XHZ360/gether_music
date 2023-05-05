import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

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
    return handler.next(e);
  },
);
final dioTongZhong = Dio(BaseOptions(
  baseUrl: 'https://tonzhon.com/api',
  connectTimeout: 5.seconds,
  receiveTimeout: 3.seconds,
));
final dioMusicApi = Dio(BaseOptions(
  baseUrl: 'https://music-api.tonzhon.com',
  connectTimeout: 5.seconds,
  receiveTimeout: 3.seconds,
));

initDio() {
  dioTongZhong.interceptors.add(generalInterceptor);
  dioMusicApi.interceptors.add(generalInterceptor);
}
