import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  // Method to update a product

  Future<ProductModel> updateProduct({
    required String productId,
    required String title,
    required String price,
    required String description,
    required String category,
    required String image,
  }) async {
    var data = await Api().put(url: "$baseUrl/products/$productId", body: {
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
    });
    return ProductModel.fromJson(data);
  }
}

