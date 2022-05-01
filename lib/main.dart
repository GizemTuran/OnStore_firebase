import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:onstore/pages/home/home_page.dart';

import 'package:onstore/pages/splash/splash_screen.dart';
<<<<<<< HEAD
import 'package:onstore/theme.dart';
=======
import 'package:onstore/routes.dart';
>>>>>>> 2fa4eb4e981655738a4eb0ee572940926628da49
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
<<<<<<< HEAD

      initialRoute: '/home',
      routes: {
        '/': (context) => const HomeWidget(),
        HomePage.routeName: (context) => HomePage(),
        '/login': (context) => const LoginPage(),
        '/newPage': (context) => const NewPage()
      },

      theme: theme()
=======
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      //home: SplashScreen()
      initialRoute: SplashScreen.routeName,
      routes: routes,
>>>>>>> 2fa4eb4e981655738a4eb0ee572940926628da49
    );
  }
}


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
        body: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context,'/landing');
            }, child: Text("Landing"))
          ],
        ),
      );
  }
}


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


