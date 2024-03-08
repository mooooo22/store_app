import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProduct {
  final Dio dio = Dio();
  final baseUrl = 'https://fakestoreapi.com';
  Future<List<ProductModel>> getAllProduct() async {
    Response response = await dio.get('$baseUrl/products');
    List<ProductModel> products = [];
    response.data.forEach((product) {
      products.add(ProductModel.fromJson(product));
    });
  
    return products;
  }
}
