import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onstore/pages/splash/splash_screen.dart';
import 'package:onstore/routes.dart';
import 'package:onstore/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase OnStore App',
        initialRoute: SplashScreen.routeName,
        routes: routes,
        theme: theme());
  }
}
