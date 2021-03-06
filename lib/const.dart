import 'package:flutter/material.dart';

//* all my colors panel are here
const primaryColor = Color(0xFF313B4E);
const navIconInactive = Color(0xFF69748E);
const navBgColor = Color(0xFF0e153a);
const testColor = Color(0xFF2e2e2e);

Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color(0xfffdc168),
    Color(0xfffb8080),
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

const textSTyle = TextStyle(
  color: Colors.black,
  fontSize: 30,
  fontFamily: 'Raleway',
);

const bestQuote = TextStyle(
  color: Colors.white,
  letterSpacing: .2,
  fontFamily: 'Raleway',
);

const wordQ = TextStyle(
  color: Colors.white,
  fontSize: 50,
  letterSpacing: 1.5,
  fontFamily: 'Raleway',
);

const nounQ = TextStyle(
  color: Colors.black,
  fontSize: 30,
  fontFamily: 'Raleway',
);
const adjQ = TextStyle(
  color: Colors.black,
  fontFamily: 'Raleway',
  fontSize: 30,
);

const exampQ = TextStyle(
  color: Colors.black,
  fontFamily: 'Raleway',
  fontSize: 30,
);

const notIndb = TextStyle(
  color: Colors.white,
  fontFamily: 'Raleway',
  fontSize: 20,
);
const loading = TextStyle(
  color: Colors.white,
  fontFamily: 'Raleway',
  fontSize: 20,
);
