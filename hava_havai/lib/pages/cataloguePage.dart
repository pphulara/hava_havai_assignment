import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hava_havai/provider/productProvider.dart';
import 'package:hava_havai/widgets/productCard.dart';

class Cataloguepage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 213, 227),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.popAndPushNamed(context, 'cart');
            },
          ),
        ],
      ),
      body:
          products.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
    );
  }
}
