
import 'package:onstore/constants.dart';
import 'package:onstore/size_config.dart';

import './components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget{
  static String routeName ="/sign_in";
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child:SizedBox(
        width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
            "welcome",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
            ),  
            ),
            Text(
              "sign in with your email and password \nor continue with social media",
              textAlign: TextAlign.center,
            ),
            SignForm(),
          ]),
      ),
        ),
    );
  }
}
class SignForm extends StatefulWidget {
  SignForm({Key key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal:42,
                vertical: 20, 
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color:kTextColor),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: kTextColor),
                gapPadding: 10,
              ),

              ),
            ),
        ],
        ),
    );
  }
}