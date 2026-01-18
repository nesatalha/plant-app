import 'package:dio/dio.dart';
import 'package:plant_app/core/constants/api_constants.dart';

class NetworkManager {
  late final Dio _dio;

  NetworkManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException error) {
    if (error.response != null) {
      return 'Server error: ${error.response?.statusCode}';
    } else if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
      return 'Connection timeout. Please check your internet connection.';
    } else {
      return 'Network error. Please check your internet connection.';
    }
  }
}
