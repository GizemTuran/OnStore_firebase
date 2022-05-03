import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onstore/size_config.dart';

class CategoryModel {
  String? icon, text;

  CategoryModel({required this.icon, required this.text});
}

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(icon: "assets/icons/Flash Icon.svg", text: "Flash Deal"),
      CategoryModel(icon: "assets/icons/Bill Icon.svg", text: "Bill"),
      CategoryModel(icon: "assets/icons/Game Icon.svg", text: "Game"),
      CategoryModel(icon: "assets/icons/Gift Icon.svg", text: "Daily Gift"),
      CategoryModel(icon: "assets/icons/Discover.svg", text: "More"),
    ];
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (CategoryModel category in categories)
            CategoryCard(
                icon: category.icon!, text: category.text!, press: () {})
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "$text",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
