import 'package:flutter/material.dart';
import 'package:onstore/pages/splash/splash_screen.dart';
import 'package:onstore/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  static String routeName = "/loading";
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    readySharedPreferences();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child:TextButton(child: Text("devam"), onPressed: (){
        Navigator.popAndPushNamed(context,SplashScreen.routeName);
      },),
    );
  }

  Future<void> readySharedPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString("email","caniskit@gmail.com");
    await prefs.setString("password", "123456abcd");
  setState((){});
  }
}
