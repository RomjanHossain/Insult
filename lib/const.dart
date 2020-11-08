import 'package:flutter/material.dart';

//* all my colors panel are here
const primaryColor = Color(0xFF313B4E);
const navIconInactive = Color(0xFF69748E);
const navBgColor = Color(0xFF0e153a);

Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color(0xfffdc168),
    Color(0xfffb8080),
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

const textSTyle = TextStyle(
  color: Colors.black,
  fontSize: 30,
);
