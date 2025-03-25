import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hava_havai/models/product.dart';
import 'package:hava_havai/provider/cartProvider.dart';

class ProductCard extends ConsumerWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        leading: Image.network(product.image, width: 50, height: 50),
        title: Text(product.title),
        subtitle: Text('₹${product.discountedPrice.toStringAsFixed(2)}'),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            ref.read(cartProvider.notifier).addToCart(product);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${product.title} added to cart!')),
            );
          },
        ),
      ),
    );
  }
}
