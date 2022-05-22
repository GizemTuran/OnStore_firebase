import 'package:flutter/material.dart';
import 'package:onstore/pages/home/components/categories.dart';
import 'package:onstore/pages/home/components/discount_banner.dart';
import 'package:onstore/pages/home/components/home_header.dart';
import 'package:onstore/pages/home/components/popular_product.dart';
import 'package:onstore/pages/home/components/special_offers.dart';
import 'package:onstore/pages/products/products_screen.dart';
import 'package:onstore/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
        HomeHeader(),
        SizedBox(
          height: getProportionateScreenWidth(30),
        ),
        DiscountBanner(),
        SizedBox(
          height: getProportionateScreenWidth(30),
        ),
        Categories(),
        SizedBox(
          height: getProportionateScreenWidth(30),
        ),
        SpecialOffers(),
        SizedBox(
          height: getProportionateScreenWidth(30),
        ),
        PopularProducts(),
        SizedBox(
          height: getProportionateScreenWidth(20),
        ),
      ]),
    );
  }
}
