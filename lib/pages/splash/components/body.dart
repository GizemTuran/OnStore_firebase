import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/pages/home/home_page.dart';
import 'package:onstore/pages/splash/components/splash_content.dart';
import 'package:onstore/size_config.dart';

import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String,String>> splashData = [
    {
      "text": "Welcome to OnStore! The Biggest Online Store!",
      "image" : "assets/images/s1.jpg"
    },
    {
      "text": "Teeeeeeeeeeeeeeeeest!",
      "image" : "assets/images/s2.jpg"
    },
    {
      "text": "More TEEEEEEEEEEEEEEEST!!!!",
      "image" : "assets/images/s3.jpg"
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
                image: splashData[index]["image"],
                text: splashData[index]["text"],
              ),
              ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length, (index) => buildDot(index: index)),
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                        press: () {Navigator.pushNamed(context, HomePage.routeName);},
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

  AnimatedContainer buildDot({int index}) {
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



