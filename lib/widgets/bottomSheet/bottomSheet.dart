import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String value;
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Add Insult',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              textInputAction: TextInputAction.done,
              maxLines: 10,
              decoration: InputDecoration(
                  fillColor: Colors.brown,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
              // autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (val) {
                value = val;
              },
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                print(value);

                Navigator.pop(context);
              },
              child: Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
