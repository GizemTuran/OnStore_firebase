import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/core/services/firebase_service.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/pages/details/details_screen.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text("Women", style: Theme.of(context).textTheme.headline5),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: FutureBuilder(
                future: FirebaseService.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final products = snapshot.data as List<Product>;

                    return GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) => ItemCard(
                              product: products[index],
                              press: () => Navigator.pushNamed(
                                  context, DetailsScreen.routeName,
                                  arguments: ProductDetailsArguments(
                                      product: products[index])),
                            ));
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
          ),
        ),
      ],
    );
  }
}
