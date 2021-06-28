import 'package:flutter/material.dart';
import 'package:shopping_list/Widgets/Components/Fields/myFieldForm.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLoginButton extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  final String text;
  final Color colorText;
  final Color colorButtonBackgroud;
  final Widget widgetToNavigate;
  final double paddingTop;
  final List<MyFieldForm> fields;
  final String screen;

  MyLoginButton(
      {required this.text,
      required this.colorText,
      required this.colorButtonBackgroud,
      required this.widgetToNavigate,
      required this.paddingTop,
      required this.fields,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    Future<void> _sigupUserFirebase() async {
      String user_name = fields[0].text.toString();
      String email = fields[1].text.toString();
      String password = fields[2].text.toString();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        User user = userCredential.user;
        if (user != null) {
          user.updateProfile(displayName: user_name);

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widgetToNavigate));
        }

        print(userCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    Future<void> _loginFirebase() async {
      String email = fields[0].text.toString();
      String password = fields[1].text.toString();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widgetToNavigate));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    void _selectFunction() {
      switch (screen) {
        case "welcome":
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widgetToNavigate));
          print(fields.length);
          break;
        case "signup":
          _sigupUserFirebase();
          break;
        case "login":
          _loginFirebase();
          break;
        default:
          print("Es Default");
      }
    }

    return Container(
      padding: EdgeInsets.only(top: paddingTop, bottom: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _selectFunction,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: colorButtonBackgroud,
        child: Text(
          text,
          style: TextStyle(
              color: colorText,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
