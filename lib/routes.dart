<<<<<<< HEAD
import 'package:flutter/widgets.dart';
=======
import 'package:flutter/material.dart';
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
import 'package:onstore/pages/details/details_screen.dart';
import 'package:onstore/pages/forgot_password/forgot_password_screen.dart';
import 'package:onstore/pages/home/home_page.dart';
import 'package:onstore/pages/login_success/login_success_screen.dart';
import 'package:onstore/pages/sign_in/sign_in_screen.dart';
import 'package:onstore/pages/sign_up/sign_up_screen.dart';
import 'package:onstore/pages/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
<<<<<<< HEAD
  HomePage.routeName: (context)=> HomePage(),
  ForgotPasswordScreen.routeName:(context) => ForgotPasswordScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),

};
=======
  HomePage.routeName: (context) => HomePage(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
};
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
