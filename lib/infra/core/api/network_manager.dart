import 'package:delivery_hero_flutter_study_case/infra/exports.dart';
import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkManager {
  static Dio getDio() {
    final Dio dio = Dio();
    final String baseUrl = dotEnv.env['BASE_URL']!;

    BaseOptions options = BaseOptions(
      contentType: 'application/json',
    );

    options.baseUrl = baseUrl;
    dio.options = options;

    if (foundation.kDebugMode) {
      // See network logs in the console in debug mode.
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 150,
        ),
      );
    }

    dio.httpClientAdapter = Http2Adapter(
      ConnectionManager(
        idleTimeout: 10000,
        // Ignore bad certificate
        onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
      ),
    );

    return dio;
  }

  static Map<String, dynamic> get baseQueryString => {'api_key': dotEnv.env['API_KEY'] ?? ''};
}
