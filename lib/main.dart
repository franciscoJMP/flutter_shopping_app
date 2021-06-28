import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/MainScreens/homeScreen.dart';
import 'package:shopping_list/MainScreens/login/welcomeScreen.dart';
import 'package:shopping_list/Utils/AssetsImages.dart';
import 'package:shopping_list/Utils/ConstantsApp.dart';
import 'package:shopping_list/Widgets/Desing/DesingAssets.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:developer' as developer;

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
  final Future<FirebaseApp> _initializationFirebase = Firebase.initializeApp();
  static const String TAG = "Main";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializationFirebase,
        builder: (context, snapshot) {
          //check for erros.
          if (snapshot.hasError) {
            developer.log(TAG + ", Firebase init. ERROR");
            return SnackBar(content: Text("Error inicializando Firebase"));
          } else if (snapshot.connectionState == ConnectionState.done) {
            developer.log(TAG + ", Firebase init. DONE");
            Widget loadScreen = WelcomeScreen();
            FirebaseAuth.instance.authStateChanges().listen((User? user) {
              if (user != null) {
                loadScreen = HomeScreen();
                print(user);
              }
            });

            return SplashScreen(
              seconds: ConstantsApp.TIME_SPLASH_SCREEN,
              navigateAfterSeconds: loadScreen,
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
          return CircularProgressIndicator();
        });
  }
}
