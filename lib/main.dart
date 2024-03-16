import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        focusColor: Colors.blue,
        // Change to your desired color
        disabledColor: Colors.grey, // Custom accent color
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        // ignore: prefer_const_constructors
        HomeScreen.id: (context) => HomeScreen(),
        UpdateProductScreen.id: (context) => const UpdateProductScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
