import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  static const kBaseUrl = "https://api.openweathermap.org/data/2.5";

  ApiService(this._dio);

  Future<Response> get(
      {required String url,
      required Map<String, dynamic> queryParameters}) async {
    final response = await _dio.get(url, queryParameters: queryParameters);
    return response;
  }

  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    final response = await _dio.post(url, data: data);
    return response.data;
  }
}
