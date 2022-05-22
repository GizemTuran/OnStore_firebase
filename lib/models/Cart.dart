import 'dart:collection';
import 'dart:math';

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

  double get totalPrice {
    double total = 0.0;
    final a =
        _cartItems.map((e) => e.product.price! * e.numberOfItems).toList();
    a.forEach((element) {
      total += element;
    });

    return total;
  }

  int get listcount => items.length;

  int getAmount(int index) {
    return _cartItems.elementAt(index).numberOfItems;
  }

  void add(Product product, int amount) {
    var result =
        _cartItems.indexWhere((element) => element.product.id == product.id);

    print(product.id);
    print(result);
    if (result > -1) {
      final temp = _cartItems[result];
      _cartItems.removeAt(result);
      _cartItems.add(Cart(
          numberOfItems: temp.numberOfItems + amount, product: temp.product));
    } else {
      _cartItems.add(Cart(product: product, numberOfItems: amount));
    }

    notifyListeners();
    //print(_cartItems.length);
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
