import 'package:flutter/material.dart';
import 'package:onstore/core/services/authenticationProvider.dart';
import 'package:onstore/models/Cart.dart';
import 'package:onstore/pages/cart/cart_screen.dart';
import 'package:onstore/pages/home/components/icon_btn_with_counter.dart';
import 'package:onstore/pages/home/components/search_field.dart';
import 'package:onstore/pages/loading/loading_screen.dart';
import 'package:onstore/size_config.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final cartItem = CartModel();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          Consumer<CartModel>(builder: (context, cart, child) {
            return IconBtnWithCounter(
              svgSrc: 'assets/icons/Cart Icon.svg',
              numOfItems: context.read<CartModel>().listcount,
              press: () =>
                  Navigator.pushNamed(context, CartScreen.rounteName).then((_) {
                setState(() {});
              }),
            );
          }),
          IconBtnWithCounter(
            svgSrc: 'assets/icons/logout.svg',
            numOfItems: 0,
            press: () {
              context.read<AuthenticationProvider>().signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoadingScreen.routeName, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
