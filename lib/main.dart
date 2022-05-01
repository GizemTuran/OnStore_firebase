import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:onstore/pages/splash/splash_screen.dart';
import 'constants.dart';
import 'package:onstore/pages/login_page.dart';
import 'package:onstore/pages/new_page.dart';


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
      title: 'Flutter Demo',
      /*
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomeWidget(),
        '/login': (context) => const LoginPage(),
        '/newPage': (context) => const NewPage()
      },
      */
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: SplashScreen()
    );

  }
}

/*
class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase'),
      ),
        body: Column(),
      );
  }
}
*/

/*Future<Widget>_getImage(BuildContext context, String imageName) async{
  Image image;
  await FireStorageService.loadImage(context, imageName).then((value){
  image = Image.network(
    value.toString(),
    fit: BoxFit.scaleDown,
  );
  });
  return image;
}*/

Future<Widget> _getImage(BuildContext context, String imageName) async {
  Image image;
  await FireStorageService.loadImage(context, imageName).then((value) {
    image = Image.network(value.toString(), fit: BoxFit.scaleDown);
  });
  return image;
}
class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}


