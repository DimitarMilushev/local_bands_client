import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "cookie-manager.provider.g.dart";

@Riverpod(keepAlive: true)
CookieManager cookieManager(CookieManagerRef ref) => CookieManager(CookieJar());