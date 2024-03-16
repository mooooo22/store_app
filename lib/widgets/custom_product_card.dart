import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    required this.productModel,
    super.key,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add functionality here
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 40,
                  spreadRadius: 0,
                  offset: const Offset(10, 10),
                ),
              ],
              color: const Color(0xffFFFFFF),
            ),
            child: Card(
              color: const Color(0xffFFFFFF),
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productModel.title,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis)),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${productModel.price}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const Icon(Icons.favorite, color: Colors.red, size: 15),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            bottom: 70,
            child: Image.network(
              productModel.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
