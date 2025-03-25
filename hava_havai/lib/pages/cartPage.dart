import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hava_havai/provider/cartProvider.dart';

class Cartpage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 213, 227),
        title: Text('Cart'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, 'home');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body:
          cart.isEmpty
              ? Center(child: Text('Cart is empty!'))
              : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return ListTile(
                    title: Text('${item.product.title} x${item.quantity}'),
                    subtitle: Text('₹${item.totalPrice.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed:
                          () => ref
                              .read(cartProvider.notifier)
                              .removeFromCart(item.product),
                    ),
                  );
                },
              ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          'Total: ₹${ref.watch(cartProvider.notifier).totalPrice.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
