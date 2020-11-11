import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  MyBtn(this.func, this.title, this.color);
  final Function func;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        func();
      },
      child: Text(title),
      fillColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      constraints: BoxConstraints.tightFor(
        height: 50,
        width: 100,
      ),
    );
  }
}
