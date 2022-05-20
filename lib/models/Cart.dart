import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:onstore/models/Product.dart';

class Cart {
  final Product product;
  final int numberOfItems;

  Cart({required this.product, required this.numberOfItems});
}

class CartModel extends ChangeNotifier {
  static List<Cart> _cartItems = [];

  UnmodifiableListView<Cart> get items => UnmodifiableListView(_cartItems);

  int get totalPrice => _cartItems.length * 42;

  void add(Product product, int amount) {
    if (_cartItems
        .where((element) => element.product.id == product.id)
        .isNotEmpty)
      _cartItems
          .where((element) => element.product.id == product.id)
          .elementAt(0);

    _cartItems.add(Cart(product: product, numberOfItems: amount));
    notifyListeners();
    print(_cartItems.length);
  }

  void removeAll() {
    _cartItems.clear();
    notifyListeners();
  }

  void remove(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}
