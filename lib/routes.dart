import 'package:flutter/widgets.dart';
import 'package:onstore/pages/home/home_page.dart';
import 'package:onstore/pages/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomePage.routeName: (context)=> HomePage(),
};