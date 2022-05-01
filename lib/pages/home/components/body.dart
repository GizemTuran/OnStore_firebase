import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * (0.6),
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
                              horizontal: getProportionateScreenWidth(20),
                              vertical: getProportionateScreenHeight(11),
                            )),
                      )),
                  Stack(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(10)),
                        height: getProportionateScreenHeight(46),
                        width: getProportionateScreenWidth(46),
                        decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("assets/icons/Bell.svg"),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: getProportionateScreenWidth(16),
                          width: getProportionateScreenWidth(16),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF4848),
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.5, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
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
