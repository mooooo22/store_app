import 'package:flutter/material.dart';
import 'package:store_app/services/all_categories.dart';

import 'package:store_app/services/get_category_service.dart';

void main() {
  GetAllCategories().getAllCategories();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
