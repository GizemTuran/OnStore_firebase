import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/core/services/firebase_service.dart';
import 'package:onstore/pages/sign_in/sign_in_screen.dart';
import 'package:onstore/shared/components/product_card.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/pages/home/components/special_title.dart';
import 'package:onstore/size_config.dart';
import 'package:firebase_database/firebase_database.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  void BtnClick() {
    print("btnclick");
    setState(() {});
    FirebaseService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () => BtnClick(), child: Text("Print Products")),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
      height: getProportionateScreenWidth(250),
      width: getProportionateScreenHeight(390),
      child: FutureBuilder(
          future: FirebaseService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final products = snapshot.data as List<Product>;
              print("${products.length} snap");
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, index) {
                    return ProductCard(product: products[index]);
                  });
            } else {
              return Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.width / 1.2,
                child: CircularProgressIndicator(
                  color: kSecondaryColor.withOpacity(1),
                ),
              );
            }
            return SizedBox();
          }),
    );
  }
}
