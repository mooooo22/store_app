import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategory {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    Response response =
        await Api().get('$baseUrl/products/category/$categoryName');

    log(response.statusMessage.toString());
    List<ProductModel> products = [];
    response.data.forEach((product) {
      products.add(ProductModel.fromJson(product));
    });
    log(products[0].description.toString());
    return products;
  }
}
