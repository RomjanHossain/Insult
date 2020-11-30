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

class MyBtn2 extends StatelessWidget {
  MyBtn2(this.func, this.title, this.color, this.color2);
  final Function func;
  final String title;
  final Color color;
  final Color color2;
  @override
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        func();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.0),
      ),
      padding: EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color2,
              color,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(80.0),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class MyBtn3 extends StatelessWidget {
  MyBtn3(
    this.func,
    this.title,
  );
  final Function func;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      child: OutlineButton(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          func();
        },
        color: Colors.white,
        borderSide: BorderSide(
          color: Colors.white,
          width: .5,
        ),
        highlightedBorderColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
