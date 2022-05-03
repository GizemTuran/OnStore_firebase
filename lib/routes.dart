import 'package:flutter/widgets.dart';
import 'package:onstore/pages/forgot_password/forgot_password_screen.dart';
import 'package:onstore/pages/home/home_page.dart';
import 'package:onstore/pages/sign_in/sign_in_screen.dart';
import 'package:onstore/pages/sign_up/sign_up_screen.dart';
import 'package:onstore/pages/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomePage.routeName: (context) => HomePage(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
};
