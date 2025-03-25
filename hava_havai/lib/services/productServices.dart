import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class Productservices {
  static Future<List<Product>> fetchProducts(int page, int limit) async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
