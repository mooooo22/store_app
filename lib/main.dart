import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:store_app/helper/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Floating Button Example'),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text('Hello, World!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
           
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
