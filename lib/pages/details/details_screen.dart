
import 'package:flutter/material.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/pages/details/components/body.dart';
import 'package:onstore/pages/details/components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  @override
Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: agrs.product.rating!),
      ),
      body: Body(product: agrs.product),
    );
  }
}


class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}