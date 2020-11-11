import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  MyBtn(this.func, this.title);
  final Function func;
  final String title;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        func();
      },
      child: Text(title),
      fillColor: Colors.green,
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
