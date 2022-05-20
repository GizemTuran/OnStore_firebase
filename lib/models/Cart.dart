import 'package:onstore/models/Product.dart';

class Cart {
  final Product product;
  final int numberOfItems;

  Cart({required this.product, required this.numberOfItems});
}

List<Cart> cartItems = [
  Cart(product: demoProducts[1], numberOfItems: 2),
  Cart(product: demoProducts[0], numberOfItems: 1),
  Cart(product: demoProducts[3], numberOfItems: 3),
];

List<Cart> firebaseCartItems = [];
