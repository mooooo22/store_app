import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class Api {
  Future<dynamic> get(String url) async {
    final Dio dio = Dio();
    try {
      Response response = await dio.get(url);

      return response.data;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  Future<dynamic> post(
      {required String url, dynamic body, String? token}) async {
    final Dio dio = Dio();

    final Map<String, String> headers = {};

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    dio.options.headers = headers;
    try {
      Response response = await dio.post(
        url,
        data: body,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(jsonDecode(response.data));
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }

  Future<dynamic> put(
      {required String url, dynamic body, String? token}) async {
    final Dio dio = Dio();

    final Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json', // Change content type to JSON
    });
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    dio.options.headers = headers;
    try {
      Response response = await dio.put(url, data: jsonEncode(body)
          // Convert body to JSON if it's a Map
          );
      if (response.statusCode == 200) {
        log(response.data.toString());
        return response.data;
      } else {
        throw Exception(response.data);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
