import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/core/services/firebase_service.dart';
import 'package:onstore/shared/components/product_card.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/pages/home/components/special_title.dart';
import 'package:onstore/size_config.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SectionTitle(text: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PopularProductCardList(),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}

class PopularProductCardList extends StatelessWidget {
  const PopularProductCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(230),
      width: SizeConfig.screenWidth,
      child: FutureBuilder(
          future: FirebaseService.getPopProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final products = snapshot.data as List<Product>;

              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, index) {
                    if (products[index].isPopular != null &&
                        products[index].isPopular == true) {
                      return ProductCard(product: products[index]);
                    }
                    return SizedBox.shrink();
                  });
            } else {
              return Center(
                child: Container(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: kPrimaryColor.withOpacity(1),
                  ),
                ),
              );
            }
            return SizedBox();
          }),
    );
  }
}
