import 'dart:developer';

import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetCategory {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List<ProductModel> products = [];
    List<dynamic> response =
        await Api().get('$baseUrl/products/category/$categoryName');

    for (var product in response) {
      products.add(ProductModel.fromJson(product));
    }
    log(products[0].description.toString());
    return products;
  }
}
