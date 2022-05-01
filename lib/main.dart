import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase'),
        ), 
          body: Center(
            child: FutureBuilder(
              future: _getImage(context, "test/minions.jpg"),
              builder: (context,snapshot){
                if(snapshot.connectionState==ConnectionState.done){
                  return Container(
                    width: MediaQuery.of(context).size.width /1.2,
                    height:MediaQuery.of(context).size.width /1.2,
                    child: snapshot.data,
                  );
                }
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Container(
                    width: MediaQuery.of(context).size.width /1.2,
                    height:MediaQuery.of(context).size.width /1.2,
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
              ),
                ),
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

