import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/homeScreen.dart';
import 'package:shopping_list/MainScreens/login/welcomeScreen.dart';
import 'package:shopping_list/Utils/AssetsImages.dart';
import 'package:shopping_list/Utils/ConstantsApp.dart';
import 'package:shopping_list/Widgets/Desing/DesingAssets.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Utils/TextApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff2c2b50),
        accentColor: Color(0xffedecee),
        primaryColorDark: Color(0xff050028),
        primaryColorLight: Color(0xff57547c),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: ConstantsApp.TIME_SPLASH_SCREEN,
      navigateAfterSeconds: WelcomeScreen(),
      image: AssetsImages.ImageLogo(),
      photoSize: 100,
      loaderColor: Theme.of(context).accentColor,
      loadingText: Text(
        TextApp.LOADING,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      gradientBackground: DesingAssets.linearGradientMain(context),
    );
  }
}
