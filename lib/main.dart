import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onstore/core/services/authenticationProvider.dart';
import 'package:onstore/models/Cart.dart';
import 'package:onstore/models/ProductFilter.dart';
import 'package:onstore/pages/loading/loading_screen.dart';
import 'package:onstore/routes.dart';
import 'package:onstore/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationProvider>(
              create: (_) => AuthenticationProvider(FirebaseAuth.instance)),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationProvider>().authState,
            initialData: null,
          ),
          ChangeNotifierProvider(create: (context) => ProductFilterProvider()),
          ChangeNotifierProvider(create: (context) => CartModel())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Firebase OnStore App',
            initialRoute: LoadingScreen.routeName,
            routes: routes,
            theme: theme()));
  }
}
