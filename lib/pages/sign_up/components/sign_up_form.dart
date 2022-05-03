import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../shared/components/custom_surfix_icon.dart';
import '../../../shared/components/default_button.dart';
import '../../../shared/components/form_error.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirm_password;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfPasswordFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text:"Continue",
            press: () {
              if(_formKey.currentState.validate()){
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return buildConfPasswordFormField();
  }

  TextFormField buildConfPasswordFormField() {
    return TextFormField(
    obscureText: true,
    onSaved: (newValue) => confirm_password = newValue,
    onChanged: (value) {
      if (password == confirm_password) {
        removeError(error: kMatchPassError);
      } 
      //else if (value.length >= 8) {
        //removeError(error: kShortPassError);
      //}
      return null;
    },
    validator: (value) {
      if (value.isEmpty) {
        return "";
      } else if (password != confirm_password) {
        addError(error: kMatchPassError);
        return "";
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: "Confirm Password",
      hintText: "Re-enter your password",
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: CustomSurffixicon(svgIcon: "assets/icons/Lock.svg"),
    ),
  );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixicon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
