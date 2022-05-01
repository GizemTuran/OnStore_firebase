import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key, this.text, this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(onPressed: press,
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
        child: Text(text, style: TextStyle(fontSize: getProportionateScreenWidth(18)),)),
    );
  }
}