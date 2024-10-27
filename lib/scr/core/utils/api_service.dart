import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> get(String url, Map<String, dynamic> queryParameters) async {
    final response = await Dio().get(url, queryParameters: queryParameters);
    return response;
  }

  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> data) async {
    final response = await dio.post(url, data: data);
    return response.data;
  }
}
