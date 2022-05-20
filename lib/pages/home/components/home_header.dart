import 'package:flutter/material.dart';
import 'package:onstore/models/Cart.dart';
import 'package:onstore/pages/cart/cart_screen.dart';
import 'package:onstore/pages/home/components/icon_btn_with_counter.dart';
import 'package:onstore/pages/home/components/search_field.dart';
import 'package:onstore/size_config.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: 'assets/icons/Cart Icon.svg',
            numOfItems: cartItems.length,
            press: () =>
                Navigator.pushNamed(context, CartScreen.rounteName).then((_) {
              setState(() {});
            }),
          ),
          IconBtnWithCounter(
            svgSrc: 'assets/icons/Bell.svg',
            numOfItems: 4,
            press: () {},
          ),
        ],
      ),
    );
  }
}
