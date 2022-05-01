import 'package:flutter/material.dart';
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width  * (0.6),
                    height: 50,
                    decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(onChanged: (value){
                      //search value
                    },
                      decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search Product",
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(9),

                      )
                    ) ,)
                  ),
                )
              ],
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
