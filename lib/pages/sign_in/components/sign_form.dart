import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/core/services/authenticationProvider.dart';
import 'package:onstore/shared/components/custom_surfix_icon.dart';
import 'package:onstore/shared/components/default_button.dart';
import 'package:onstore/shared/components/form_error.dart';
import 'package:onstore/pages/forgot_password/forgot_password_screen.dart';
import 'package:onstore/pages/login_success/login_success_screen.dart';
import 'package:onstore/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? _email;
  String? _password;
  bool remember = false;
  final List<String> errors = [];
  var pwd = TextEditingController();
  var eml = TextEditingController();
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
  void initState() {
    super.initState();
    readySharedPreferences();
  }

  Future<void> readySharedPreferences() async {
    var sharedPreferences = await SharedPreferences.getInstance();

    this._email = sharedPreferences.getString("email") ?? "";
    this._password = sharedPreferences.getString("password") ?? "";
    setState(() {
      eml.text = _email!;
      pwd.text = _password!;
      _email != "" && _password != "" ? remember = true : remember = false;
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
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final response = await context
                    .read<AuthenticationProvider>()
                    .signIn(email: eml.text.trim(), password: pwd.text.trim());
                final perfs = await SharedPreferences.getInstance();

                if (response == "Success" || response == "Signed in!") {
                  if (remember) {
                    await perfs.setString("email", eml.text.trim());
                    await perfs.setString("password", pwd.text.trim());
                  } else {
                    await perfs.remove('email');
                    await perfs.remove('password');
                  }
                  Navigator.popAndPushNamed(
                      context, LoginSuccessScreen.routeName);
                } else {
                  final snackBar = SnackBar(
                    content: Text(response),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: pwd,
      obscureText: true,
      onSaved: (newValue) => password = _password,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixicon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: eml,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = _email,
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
