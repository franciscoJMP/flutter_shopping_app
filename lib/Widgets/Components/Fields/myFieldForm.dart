import 'package:flutter/material.dart';

class MyFieldForm extends StatelessWidget {
  String title;
  bool isPassword = false;
  String text = "";
  MyFieldForm({required this.title, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              obscureText: isPassword,
              onChanged: (value) => {text = value},
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xffDBDBDB),
                  filled: true),
            ),
          )
        ],
      ),
    );
  }
}
