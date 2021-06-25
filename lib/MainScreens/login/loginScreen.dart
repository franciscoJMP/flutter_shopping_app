import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:shopping_list/MainScreens/homeScreen.dart';
import 'package:shopping_list/MainScreens/login/signUp.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Buttons/myBackButton.dart';
import 'package:shopping_list/Widgets/Buttons/myLoginButton.dart';
import 'package:shopping_list/Widgets/Components/Containers/containerShape01.dart';
import 'package:shopping_list/Widgets/Components/Fields/myFieldForm.dart';
import 'package:shopping_list/Widgets/Desing/DesingAssets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _emailPasswordWidget() {
    return Column(
      children: [
        MyFieldForm(TextApp.EMAIL_FIELD, false),
        MyFieldForm(TextApp.PASSWORD_FIELD, true),
      ],
    );
  }

  Widget _forgottenPassword() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Text(
        TextApp.FORGOT_PASSWORD,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(TextApp.OR),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _singUpLabel() {
    return FlatButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUp())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TextApp.DONT_HAVE_ACCOUNT,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                TextApp.SINGUP,
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
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          ContainerShape01(),
          Positioned(
            top: height * .020,
            child: MyBackButton(),
          ),
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
                  MyLoginButton(TextApp.LOGIN, Colors.white,
                      Theme.of(context).primaryColor, HomeScreen(), 20.0),
                  _forgottenPassword(),
                  _divider(),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: GoogleSignInButton(
                      centered: true,
                      borderRadius: 5,
                      onPressed: () {},
                      darkMode: false,
                      text: TextApp.GOOGLE_SIGN,
                    ),
                  ),
                  _singUpLabel()
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
