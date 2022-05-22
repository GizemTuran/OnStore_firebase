import 'package:flutter/material.dart';
import 'package:onstore/pages/products/components/body.dart';

class ProductScreen extends StatelessWidget {
  static String routeName = '/products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
