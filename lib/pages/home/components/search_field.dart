import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth * (0.6),
        height: 50,
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (value) {
            //search value
          },
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search Product",
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(25),
                vertical: getProportionateScreenHeight(15),
              )),
        ));
  }
}
