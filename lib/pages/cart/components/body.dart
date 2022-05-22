import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/models/Cart.dart';
import 'package:onstore/pages/cart/components/cart_item_card.dart';
import 'package:onstore/size_config.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.dismiss}) : super(key: key);

  final DismissDirectionCallback dismiss;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final cartItems = CartModel();
    return cartItems.items.length == 0
        ? Container(
            width: 300,
            height: 300,
            child: Text("EMPTYYYY!"),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            itemCount: cartItems.items.length,
            itemBuilder: (context, index) => Consumer<CartModel>(
                  builder: (context, cart, child) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(cart.items[index].product.id.toString()),
                          background: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFE6E6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                const Spacer(),
                                SvgPicture.asset("assets/icons/Trash.svg")
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            widget.dismiss.call(direction);
                            cart.remove(index);
                          },
                          child: CartItemCard(cart: cart.items[index]),
                        ));
                  },
                ));
  }
}
