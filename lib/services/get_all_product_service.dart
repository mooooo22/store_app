import 'package:dio/dio.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProduct {
  final Dio dio = Dio();
  
  Future<List<ProductModel>> getAllProduct() async {
    Api api = Api();
    Response response = await api.get('$baseUrl/products');
    List<ProductModel> products = [];
    response.data.forEach((product) {
      products.add(ProductModel.fromJson(product));
    });

    return products;
  }
}
