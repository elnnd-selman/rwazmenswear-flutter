import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laraflutter/config/string_constant.dart';
import 'package:print_color/print_color.dart';

final options = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.request,
  maxStale: const Duration(days: 7),
  priority: CachePriority.normal,
  cipher: null,
  keyBuilder: CacheOptions.defaultCacheKeyBuilder,
  allowPostMethod: false,
);

final dio = Dio()..interceptors.add(DioCacheInterceptor(options: options));

class ApiConfig {
  final String url;
  ApiConfig({
    required this.url,
  });

  static const isLocale = false;
  static const isHttps = true;

  static const domain = isLocale ? '10.0.2.2:8000' : 'rwazmenswear.com';
  static const baseUrl = "${isHttps ? 'https://' : 'http://'}$domain/api/";
  static const baseUrlFile = "${isHttps ? 'https://' : 'http://'}$domain/";

  Future<Response<dynamic>> get({
    Map? data,
    Map? params,
  }) async {
    try {
      final response = await dio.get(
        "$baseUrl$url",
        options: Options(headers: {
          'authorization':
              "Bearer ${GetStorage().read(AppStringConstant.accessToken)}",
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Connection': 'Keep-Alive'
        }),
        data: data,
      );
      Print.yellow(
        "GET : $baseUrl$url",
      );
      return response;
    } on DioException catch (e) {
      Print.red(
          '----------------------------------------------------------------');
      Print.red(
        "GET : $baseUrl$url",
      );
      Print.red(e.response);

      // Print.red(e.response);

      if (e.response != null &&
          e.response!.data != null &&
          e.response!.data['message'].toString().contains('Unauthenticated')) {}
      if (e.response!.data['message'] != null &&
          e.response!.data['message'].contains('Unauthenticated')) {}
      Print.red(
          '----------------------------------------------------------------');

      return e.response!;
    }
  }

  Future<Response<dynamic>> post(
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    Print.green('POST_DATA:$data');
    try {
      final response = await dio.post("$baseUrl$url",
          data: data,
          queryParameters: params,
          options: Options(
            headers: {
              "Accept": "application/json",
              "Contnet-Type": "application/json",
              'authorization':
                  "Bearer ${GetStorage().read(AppStringConstant.accessToken)}",
            },
          ));

      Print.yellow(
        "POST : $baseUrl$url",
      );

      return response;
    } on DioException {
      rethrow;
    }
  }
}
