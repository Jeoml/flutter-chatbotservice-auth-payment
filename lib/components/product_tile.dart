import 'package:flutter/material.dart';
import 'package:flutterchatbot/components/my_button.dart';
import 'package:flutterchatbot/components/my_small_button.dart';

class ProductTile extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final VoidCallback onAddToCart;

  const ProductTile({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(productDescription),
            const SizedBox(height: 8),
            Text('\$${productPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            // ElevatedButton(
            //   onPressed: onAddToCart,
            //   child: Text('Add to Cart'),
            // ),
            MySmallButton(text: 'Add to Cart', onTap: onAddToCart)
          ],
        ),
      ),
    );
  }
}