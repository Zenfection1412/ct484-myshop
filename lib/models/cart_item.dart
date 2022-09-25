class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});

  CartItem coppyWith({
    String? id,
    String? title,
    int? quantity,
    double? price,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}