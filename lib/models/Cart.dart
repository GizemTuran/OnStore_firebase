import 'package:onstore/models/Product.dart';

class Cart {
  final Product product;
  final int numberOfItems;

  Cart({required this.product, required this.numberOfItems});
}

List<Cart> cartItems = [];
