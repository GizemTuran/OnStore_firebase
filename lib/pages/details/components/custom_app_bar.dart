import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onstore/pages/home/home_page.dart';
import 'package:onstore/shared/components/rounded_icon_btn.dart';

class CustomAppBar extends StatelessWidget {
  final double rating;

  CustomAppBar({required this.rating});
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white, shape: CircleBorder()),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Row(children: [
                Text(
                  rating.toString(),
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset("assets/icons/Star Icon.svg"),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
