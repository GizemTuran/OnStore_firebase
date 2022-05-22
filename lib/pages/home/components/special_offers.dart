import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/core/services/firebase_service.dart';
import 'package:onstore/pages/home/components/special_offer_card.dart';
import 'package:onstore/pages/products/products_screen.dart';
import 'package:onstore/size_config.dart';

import 'special_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
            text: "Categories",
            press: () {
              Navigator.pushNamed(context, ProductScreen.routeName);
            }),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SpecialOfferCard(
                      image: "assets/images/Image Banner 2.png",
                      category: "Electronics",
                      numOfBrands: snapshot.data as int,
                      press: () {},
                    );
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
                },
                future: FirebaseService.getProductCount("electronics"),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return SpecialOfferCard(
                      image: "assets/images/Image Banner 3.png",
                      category: "Fashion",
                      numOfBrands: snapshot.data as int,
                      press: () {},
                    );
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
                },
                future: FirebaseService.getProductCount("fashion"),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
