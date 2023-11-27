import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  ApiServices(this._dio);

  Future<Map<String, dynamic>> getData({required String url}) async {
    //to receive data
    var response = await _dio.get('$_baseUrl$url');
    //to return data 
    return response.data;
  }
}
