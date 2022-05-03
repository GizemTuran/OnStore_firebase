import 'package:flutter/material.dart';
import 'package:onstore/shared/components/product_card.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/pages/home/components/special_title.dart';
import 'package:onstore/size_config.dart';
import 'package:firebase_database/firebase_database.dart';

class PopularProducts extends StatelessWidget {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  void BtnClick() async {
    print("btnclick");
    final snapshot = await ref.child('products').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: BtnClick, child: Text("Print Products")),
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
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular != null)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
