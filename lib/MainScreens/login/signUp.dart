import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/homeScreen.dart';
import 'package:shopping_list/MainScreens/login/loginScreen.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Buttons/myBackButton.dart';
import 'package:shopping_list/Widgets/Buttons/myLoginButton.dart';
import 'package:shopping_list/Widgets/Components/Containers/containerShape01.dart';
import 'package:shopping_list/Widgets/Components/Fields/myFieldForm.dart';
import 'package:shopping_list/Widgets/Desing/DesingAssets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static MyFieldForm user_name =
      MyFieldForm(title: TextApp.USER_NAME, isPassword: false);
  static MyFieldForm email_field =
      MyFieldForm(title: TextApp.EMAIL_FIELD, isPassword: false);
  static MyFieldForm password_field =
      MyFieldForm(title: TextApp.PASSWORD_FIELD, isPassword: true);
  Widget _emailPasswordWidget() {
    return Column(
      children: [
        user_name,
        email_field,
        password_field,
      ],
    );
  }

  Widget _singUpLabel() {
    return FlatButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TextApp.I_HAVE_ACCOUNT,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                TextApp.LOGIN,
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final List<MyFieldForm> fields = [];
    fields.add(user_name);
    fields.add(email_field);
    fields.add(password_field);

    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ContainerShape01(),
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: height * .13),
                      child: DesingAssets.titleCustomDark()),
                  Padding(
                      padding: EdgeInsets.only(top: height * .03),
                      child: _emailPasswordWidget()),
                  MyLoginButton(
                    text: TextApp.SINGUP,
                    colorText: Colors.white,
                    colorButtonBackgroud: Theme.of(context).primaryColor,
                    widgetToNavigate: HomeScreen(),
                    paddingTop: 20.0,
                    fields: fields,
                    screen: "signup",
                  ),
                  _singUpLabel()
                ],
              ),
            ),
          ),
          Positioned(
            top: height * .025, //0.25%
            child: MyBackButton(),
          ),
        ],
      ),
    ));
  }
}

class USER_NAME {}
