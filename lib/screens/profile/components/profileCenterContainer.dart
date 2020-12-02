import 'package:flutter/material.dart';

class ProfileCenterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2.5,
      decoration: BoxDecoration(
        color: Color(0xFF182C61),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            offset: Offset(4, 4),
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(.4),
            blurRadius: 5,
            offset: Offset(-4, -4),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'You haven\'t added any insult',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
