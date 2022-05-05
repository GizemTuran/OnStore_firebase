import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
<<<<<<< HEAD
=======
import 'package:http/http.dart';
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
import 'package:onstore/constants.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
<<<<<<< HEAD
    required this.product, required this.pressOnSeeMore,
=======
    required this.product,
    required this.pressOnSeeMore,
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
  }) : super(key: key);

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
<<<<<<< HEAD
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
=======
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
          child: Text(
            product.title!,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
<<<<<<< HEAD
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: product.isFavourite != null && product.isFavourite == true ? Color(0xFFFFE6E6) : Color(0xFFF5F6F6),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
            ),
            child: SvgPicture.asset("assets/icons/Heart Icon_2.svg", color: product.isFavourite != null && product.isFavourite! == true ? Color(0xFFFF4848) : Color(0xFFDBDEE4)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(64)),
=======
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(10)),
              child: Text(
                "\$${product.price}",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                width: getProportionateScreenWidth(64),
                decoration: BoxDecoration(
                    color: product.isFavourite != null &&
                            product.isFavourite == true
                        ? Color(0xFFFFE6E6)
                        : Color(0xFFF5F6F6),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
                    color: product.isFavourite != null &&
                            product.isFavourite! == true
                        ? Color(0xFFFF4848)
                        : Color(0xFFDBDEE4)),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64)),
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
          child: Text(
            product.description!,
            maxLines: 3,
          ),
        ),
        Padding(
<<<<<<< HEAD
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: 10),
=======
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20), vertical: 10),
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
          child: GestureDetector(
            onTap: pressOnSeeMore,
            child: Row(
              children: [
                Text(
                  "See more Details",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward_ios, size: 12, color: kPrimaryColor)
              ],
            ),
          ),
        )
      ],
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
