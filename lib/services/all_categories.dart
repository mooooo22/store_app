import 'dart:developer';

import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories = await Api().get('$baseUrl/products/categories');

    log(categories.toString());
    return categories;
  }
}
