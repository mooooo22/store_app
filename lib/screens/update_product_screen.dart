import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static const String id = 'update_product_screen';

  @override
  _UpdateProductScreenState createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  // Declare variables and controllers for the form fields
  String? _productName;
  String? _productDescription;
  String? _productPrice;
  String? _productImageURL;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Extract the product model from the arguments
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when the user taps on the screen
        FocusScope.of(context).unfocus();
      },
      child: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Update Product'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                // Implement your form fields here
                child: Column(
                  children: [
                    Image.network(product.image, height: 200, width: 200),

                    // Add your form fields here
                    CustomTextField(
                      label: 'Product Name',
                      onChanged: (value) {
                        // Implement the onChanged callback here
                        _productName = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      label: 'price',
                      onChanged: (value) {
                        // Implement the onChanged callback here
                        _productPrice = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      label: ' Product Description',
                      onChanged: (value) {
                        // Implement the onChanged callback here
                        _productDescription = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      label: 'image URL',
                      onChanged: (value) {
                        // Implement the onChanged callback here
                        _productImageURL = value;
                      },
                    ),

                    // Example: TextFormField, DropdownButtonFormField, etc.
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              setState(() {
                _isLoading = true;
              });
              // Implement your update logic here
              await updatingProduct(product);
              log('Product Updated');
              setState(() {
                _isLoading = false;
              });
            },
            child: const Icon(Icons.save),
          ),
        ),
      ),
    );
  }

  Future updatingProduct(ProductModel product) async {
    try {
      await UpdateProductService().updateProduct(
        productId: product.id,
        title: _productName == null ? product.title : _productName!,
        price:
            _productPrice == null ? product.price.toString() : _productPrice!,
        description: _productDescription == null
            ? product.description
            : _productDescription!,
        category: product.category,
        image: _productImageURL == null ? product.image : _productImageURL!,
      );
    } catch (e) {
      // TODO
      log(e.toString());
    }
  }
}
