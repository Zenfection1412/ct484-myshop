import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final ValueNotifier<bool> _isFavorite;

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
  
  Product({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    isFavorite = false,
  }) : _isFavorite = ValueNotifier(isFavorite);

  Product coppyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite {
    return _isFavorite.value;
  }

  ValueListenable<bool> get isFavoriteListenable {
    return _isFavorite;
  }
}