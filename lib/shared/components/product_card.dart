import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/core/services/firebase_service.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/pages/details/details_screen.dart';
import 'package:onstore/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
<<<<<<< HEAD
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
=======
          onTap: () => Navigator.pushNamed(context, DetailsScreen.routeName,
              arguments: ProductDetailsArguments(product: product)),
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
<<<<<<< HEAD
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: Image.asset(product.images![0]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title!,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
=======
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: FutureBuilder(
                      future: getImage(context, product.images![0]),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return (snapshot.data as Image);
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.width / 1.2,
                            child: CircularProgressIndicator(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                          );
                        }
                        return Container();
                      },
                    ))),
              ),
              const SizedBox(height: 10),
              Container(
                height: 35,
                child: Text(
                  product.title!,
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
              ),
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
<<<<<<< HEAD
                        color: product.isFavourite != null && product.isFavourite! == true
=======
                        color: product.isFavourite != null &&
                                product.isFavourite == true
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
<<<<<<< HEAD
                        color: product.isFavourite != null && product.isFavourite! == true
=======
                        color: product.isFavourite != null &&
                                product.isFavourite == true
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}