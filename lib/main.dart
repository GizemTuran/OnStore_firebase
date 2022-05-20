import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onstore/models/Cart.dart';
import 'package:onstore/pages/loading/loading_screen.dart';

import 'package:onstore/routes.dart';
import 'package:onstore/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider(create: (context) => CartModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase OnStore App',
        initialRoute: LoadingScreen.routeName,
        routes: routes,
        theme: theme());
  }
}
