import 'dart:developer';

import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductService {
  Future<List<ProductModel>> getAllProduct() async {
    List<ProductModel> products = [];
    log("Get all products");
    List<dynamic> data = await Api().get('$baseUrl/products');
    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }
    for (var product in products) {
      log(product.rating.rate.toString());
    }
    return products;
  }
}
