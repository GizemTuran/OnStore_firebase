import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:onstore/pages/sign_in/sign_in_screen.dart';
import 'package:onstore/routs.dart';
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
      title: 'Flutter Demo',

      initialRoute: SplashScreen.routeName,
      routes: routes,

      theme: theme()
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


