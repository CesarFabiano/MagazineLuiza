class Product {
  final String photo;
  final String name;
  final String descripition;
  final double price;
  final int parcel;
  bool isFavorite;

  Product({
    required this.photo,
    required this.name,
    required this.descripition,
    required this.price,
    required this.parcel,
    this.isFavorite = false,
  });
}
