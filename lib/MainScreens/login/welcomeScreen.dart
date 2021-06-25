import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/login/loginScreen.dart';
import 'package:shopping_list/Utils/TextApp.dart';
import 'package:shopping_list/Widgets/Buttons/myLoginButton.dart';
import 'package:shopping_list/Widgets/Desing/DesingAssets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

Widget _singUp(BuildContext context) {
  return Container(
    width: double.infinity,
    child: OutlineButton(
      borderSide: BorderSide(color: Colors.white),
      highlightedBorderColor: Theme.of(context).primaryColorLight,
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen())),
      child: Text(
        TextApp.SINGUP,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
  );
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Scroll, debido a que en dispositivos pequeños puede no verse el contenido
        body: SingleChildScrollView(
          child: Container(
            //respeta un padding|margen lateral
            padding: EdgeInsets.symmetric(horizontal: 20),
            //obtenemos el alto del dispositivo
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: DesingAssets.linearGradientMain(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DesingAssets.titleCustom(),
                MyLoginButton(TextApp.LOGIN, Theme.of(context).primaryColor,
                    Colors.white, LoginScreen(), 50.0),
                _singUp(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
