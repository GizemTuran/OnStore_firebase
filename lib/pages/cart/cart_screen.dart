import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/models/Cart.dart';
import 'package:onstore/pages/cart/components/body.dart';
import 'package:onstore/shared/components/default_button.dart';
import 'package:onstore/size_config.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static String rounteName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        dismiss: (direction) {
          setState(() {});
        },
      ),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final cart = CartModel();

    return AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Consumer<CartModel>(builder: (context, cart, child) {
              return Text(
                "${cart.items.length} items",
                style: Theme.of(context).textTheme.caption,
              );
            }),
          ],
        ));
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenHeight(30)),
      //height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15)),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenHeight(40),
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                const Text("Add Coupon Code"),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<CartModel>(
                  builder: (context, cart, child) {
                    return Text.rich(TextSpan(text: "Total:\n", children: [
                      TextSpan(
                          text: "\$${cart.totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))
                    ]));
                  },
                ),
                SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Checkout",
                      press: () {},
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
