import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/pages/sign_in/sign_in_screen.dart';
import 'package:onstore/pages/splash/components/splash_content.dart';
import 'package:onstore/shared/components/default_button.dart';
import 'package:onstore/size_config.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to OnStore! The Biggest Online Store!",
      "image": "assets/images/splash4.png"
    },
    {
      "text": "Buy the Best Products at the Best Prices!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text": "Limitless Coupons and Endless Opportunities!",
      "image": "assets/images/splash5.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                        image: splashData[index]["image"]!,
                        text: splashData[index]["text"]!,
                      )),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index: index)),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      press: () {
                        Navigator.popAndPushNamed(
                            context, SignInScreen.routeName);
                      },
                      text: "Continue",
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
