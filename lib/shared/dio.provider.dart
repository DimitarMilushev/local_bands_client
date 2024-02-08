import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dio.provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) => Dio(_qaOptions);

final _qaOptions = BaseOptions(
  baseUrl: "http://192.168.100.6:4000",
  contentType: "application/json",
  responseType: ResponseType.json,
  receiveTimeout: const Duration(seconds: 8),
  connectTimeout: const Duration(seconds: 5)
);