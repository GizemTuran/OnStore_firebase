import 'package:flutter/material.dart';
import 'package:onstore/core/services/constants/enums/page_view_enums.dart';
import 'package:onstore/pages/home/components/home_header.dart';
import 'package:onstore/pages/products/products_screen.dart';
import 'package:onstore/size_config.dart';

import 'components/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }

  bool get isShopPage => currentPage == PageViews.HOME_PAGE.index;
  void onPageChanged(int val) {
    setState(() {
      currentPage = val;
    });
  }

  double get pageViewHeight => currentPage == 1 ? 0.8 : 1;
}
