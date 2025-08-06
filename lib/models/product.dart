class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final String type;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.type,
    this.description = '',
  });
}
