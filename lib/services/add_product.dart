import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

Future<ProductModel> addProduct({
  required String title,
  required String price,
  required String description,
  required String category,
  required String image,
}) async {
  var data = await Api().post(url: "$baseUrl/products", body: {
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
  });
  return ProductModel.fromJson(data);
}
