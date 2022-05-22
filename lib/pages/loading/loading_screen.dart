import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onstore/pages/home/home_page.dart';
import 'package:onstore/pages/splash/splash_screen.dart';
import 'package:onstore/size_config.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  static String routeName = "/loading";
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    SizeConfig().init(context);
    if (firebaseUser != null) {
      return HomePage();
    }
    return SplashScreen();
  }
}
