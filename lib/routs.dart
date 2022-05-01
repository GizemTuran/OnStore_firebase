import 'package:flutter/material.dart';
import 'package:onstore/pages/splash/splash_screen.dart';
import 'package:onstore/pages/sign_in/sign_in_screen.dart';
import 'package:onstore/pages/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName:(context) => SplashScreen(),
  SignInScreen.routeName:(context) => SignInScreen(),
};