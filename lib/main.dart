import 'package:flutter/material.dart';
import 'package:store_app/screens/home_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id  ,
      routes: {
        // Add routes here
      },
      home: HomeScreen() ,

    );
  }
}
