import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProduct {
  final Dio dio = Dio();

  Future<List<ProductModel>> getAllProduct() async {
    List<ProductModel> products = [];
    List<dynamic> data = await Api().get('$baseUrl/products');
    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }

    return products;
  }
}
