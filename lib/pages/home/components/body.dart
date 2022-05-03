import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/core/services/firebase_service.dart';
import 'package:onstore/pages/home/components/categories.dart';
import 'package:onstore/pages/home/components/discount_banner.dart';
import 'package:onstore/pages/home/components/home_header.dart';
import 'package:onstore/pages/home/components/popular_product.dart';
import 'package:onstore/pages/home/components/special_offers.dart';
import 'package:onstore/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          const HomeHeader(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          const DiscountBanner(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          const Categories(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          const SpecialOffers(),
          SizedBox(
            height: getProportionateScreenWidth(30),
          ),
          PopularProducts(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          Center(
              child: FutureBuilder(
            future: getImage(context, "test/minions.jpg"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.width / 2,
                  child: snapshot.data,
                );
              }
              if (snapshot.connectionState == ConnectionState.active) {
                return Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.width / 1.2,
                  child: CircularProgressIndicator(
                    color: kSecondaryColor.withOpacity(1),
                  ),
                );
              }
              return Container();
            },
          ))
        ]),
      ),
    );
  }
}
