import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/core/services/firebase_service.dart';
import 'package:onstore/core/utils/string_process.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/models/ProductFilter.dart';
import 'package:onstore/pages/details/details_screen.dart';
import 'package:onstore/pages/home/components/home_header.dart';
import 'package:onstore/size_config.dart';
import 'package:provider/provider.dart';

import 'categories.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ProductFilterProvider catsProvider;
  @override
  void initState() {
    catsProvider = context.read<ProductFilterProvider>();
    catsProvider.category = "";
  }

  void setCategory(String cat) {
    catsProvider.setCategory(cat);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    catsProvider = context.read<ProductFilterProvider>();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
          HomeHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
                Text(
                    catsProvider.category == ""
                        ? "Categories"
                        : catsProvider.category.capitalize(),
                    style: Theme.of(context).textTheme.headline5),
              ],
            ),
          ),
          Categories(
            categories: catsProvider.getCategories(),
            press: setCategory,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: FutureBuilder(
                  future:
                      FirebaseService.getProductFirestore(catsProvider.filter),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final products = snapshot.data as List<Product>;

                      return GridView.builder(
                          itemCount: products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Container(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            color: kPrimaryColor.withOpacity(1),
                          ),
                        ),
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
                    return SizedBox();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
