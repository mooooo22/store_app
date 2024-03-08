import 'dart:developer';

import 'package:dio/dio.dart';

class GetAllCategories {
  final Dio dio = Dio();
  final baseUrl = 'https://fakestoreapi.com';
  Future<List<dynamic>> getAllCategories() async {
    try {
      Response response = await dio.get('$baseUrl/products/categories');
      List<dynamic> categories = response.data;
      log(categories.toString());
      return categories;
    } on DioException catch (e) {

      final String error =
          e.response?.data['error']['message'] ?? 'Opps,Something went wrong';
      throw Exception(error);
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
