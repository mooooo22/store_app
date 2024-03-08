import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProduct {
  final Dio dio = Dio();
  final baseUrl = 'https://fakestoreapi.com';
  Future<List<ProductModel>> getAllProduct() async {
    try {
      Response response = await dio.get('$baseUrl/products');
      List<ProductModel> products = [];
      response.data.forEach((product) {
        products.add(ProductModel.fromJson(product));
      });

      return products;
    } on DioException catch (e) {
      final String error =
          e.response?.data['error']['message'] ?? 'Opps,Something went wrong';
      throw Exception(error);
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
