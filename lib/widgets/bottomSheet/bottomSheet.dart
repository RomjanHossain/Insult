import 'package:flutter/material.dart';
import 'package:insult/widgets/btn.dart';

class MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String value;
    return Material(
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
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Add Insult',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
              textInputAction: TextInputAction.done,
              maxLines: 10,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                hintText: 'Your insult here....',
                hintStyle: TextStyle(
                  color: Colors.black54,
                ),
                focusColor: Colors.black,
                // focusedBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                labelText: 'Insult',
                labelStyle: TextStyle(
                  color: Colors.black54,
                ),
              ),
              // autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (val) {
                value = val;
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyBtn(
              () {
                print(value);
                Navigator.pop(context);
              },
              'add',
              Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
