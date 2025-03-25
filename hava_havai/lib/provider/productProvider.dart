import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hava_havai/models/product.dart';
import 'package:hava_havai/services/productServices.dart';

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>>((
  ref,
) {
  return ProductNotifier()..fetchProducts();
});

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);

  int _page = 0;
  final int _limit = 10;
  bool _isFetching = false;

  Future<void> fetchProducts() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      final newProducts = await Productservices.fetchProducts(_page, _limit);
      if (newProducts.isNotEmpty) {
        state = [...state, ...newProducts];
        _page++;
      } else {
        print("No more products to load.");
      }
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      _isFetching = false;
    }
  }
}
