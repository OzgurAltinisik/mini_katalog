import 'package:flutter/material.dart';
import 'product.dart';

class Cart extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  int get itemCount => _items.length;

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }
}