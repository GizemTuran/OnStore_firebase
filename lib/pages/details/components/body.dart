import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onstore/models/Cart.dart';
import 'package:onstore/shared/components/default_button.dart';
import 'package:onstore/shared/components/rounded_icon_btn.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/pages/details/components/color_dots.dart';
import 'package:onstore/pages/details/components/product_description.dart';
import 'package:onstore/pages/details/components/product_images.dart';
import 'package:onstore/pages/details/components/top_rounded_container.dart';
import 'package:onstore/size_config.dart';

class Body extends StatelessWidget {
  final Product product;
  int amount = 1;

  Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: product, pressOnSeeMore: () {}),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(
                        product: product,
                        amount: amount,
                        amountPress: (int value) {
                          amount += value;
                        },
                      ),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            top: getProportionateScreenWidth(15),
                            bottom: getProportionateScreenWidth(35),
                          ),
                          child: DefaultButton(
                            text: "Add to Cart",
                            press: () {
                              firebaseCartItems.add(Cart(
                                  product: product, numberOfItems: amount));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



/*
class ColorDots extends StatelessWidget {
  const ColorDots({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    int selectedColor = 0;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(product.colors.length, (index) => ColorDot(color: product.colors[index], isSelected: selectedColor == index,),)
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color, this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          //color: product.colors[0],
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}
*/

