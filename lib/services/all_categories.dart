import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllCategories() async {
    
    Response response = await  Api().get('$baseUrl/products/categories');
    List<dynamic> categories = response.data;
    log(categories.toString());
    return categories;
  }
}
