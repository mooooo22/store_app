import 'dart:developer';

import 'package:dio/dio.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllCategories() async {
    final Dio dio = Dio();
    final baseUrl = 'https://fakestoreapi.com';
    Response response = await dio.get('$baseUrl/products/categories');
    List<dynamic> categories = response.data;
    log(categories.toString());
    return categories;
  }
}
