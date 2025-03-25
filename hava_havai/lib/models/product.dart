class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final double discountPercentage;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.discountPercentage,
  });

  double get discountedPrice => price - (price * discountPercentage / 100);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['thumbnail'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
    );
  }
}
