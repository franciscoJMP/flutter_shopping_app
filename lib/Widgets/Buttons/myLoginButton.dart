import 'package:flutter/material.dart';
import 'package:shopping_list/Utils/TextApp.dart';

class MyLoginButton extends StatelessWidget {
  String _text;
  Color _colorText;
  Color _colorButtonBackgroud;
  Widget _widgetToNavigate;
  double _paddingTop;
  MyLoginButton(this._text, this._colorText, this._colorButtonBackgroud,
      this._widgetToNavigate, this._paddingTop);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: _paddingTop, bottom: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => _widgetToNavigate)),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: _colorButtonBackgroud,
        child: Text(
          _text,
          style: TextStyle(
              color: _colorText,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
