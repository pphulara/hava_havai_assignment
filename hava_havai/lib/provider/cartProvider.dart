import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hava_havai/models/cart.dart';
import 'package:hava_havai/models/product.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      state[index].quantity++;
      state = List.from(state);
    } else {
      state = [...state, CartItem(product: product)];
    }
  }

  void removeFromCart(Product product) {
    state = state.where((item) => item.product.id != product.id).toList();
  }

  double get totalPrice => state.fold(0, (sum, item) => sum + item.totalPrice);
}
