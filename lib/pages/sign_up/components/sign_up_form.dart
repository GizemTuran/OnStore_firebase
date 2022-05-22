import 'package:flutter/material.dart';
import 'package:onstore/core/services/authenticationProvider.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  String? confirm_password;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
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
          buildConfPasswordFormField(passwordController2),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthenticationProvider>().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return buildConfPasswordFormField(passwordController);
  }

  TextFormField buildConfPasswordFormField(TextEditingController passwordCont) {
    return TextFormField(
      obscureText: true,
      controller: passwordCont,
      onSaved: (newValue) => confirm_password = passwordCont.text,
      onChanged: (value) {
        if (passwordCont.text == confirm_password) {
          removeError(error: kMatchPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (passwordCont.text != value) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixicon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
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
