import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onstore/pages/home/components/icon_btn_with_counter.dart';
import 'package:onstore/size_config.dart';
import 'package:onstore/constants.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                      )),
                  IconBtnWithCounter(
                    svgSrc: 'assets/icons/Cart Icon.svg',
                    numOfItems: 0,
                    press: () {},
                  ),
                  IconBtnWithCounter(
                    svgSrc: 'assets/icons/Bell.svg',
                    numOfItems: 4,
                    press: () {},
                  ),
                ],
              ),
            ),
            Center(
              child: Text("Home Page Body"),
            )
          ],
        ),
      ),
    );
  }
}
