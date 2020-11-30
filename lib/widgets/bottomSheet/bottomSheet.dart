import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insult/const.dart';

import 'package:insult/services/postData.dart';
import 'package:insult/widgets/btn.dart';
import 'package:provider/provider.dart';

PostData _post = PostData();

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet({this.ll});
  final int ll;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var usr = Provider.of<User>(context);
    String value;
    return Material(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: testColor,
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
                fontFamily: 'Raleway',
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (val) {
                  if (val.length < 10) {
                    return 'must have 11 char at least';
                  } else {
                    return null;
                  }
                },
                onSaved: (String val) {
                  value = val;
                },
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
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
                  hintStyle:
                      TextStyle(color: Colors.white60, fontFamily: 'Raleway'),
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
                    color: Colors.white60,
                  ),
                ),
                // autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (val) async {
                  value = val;
                  //! post data
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 100,
              child: MyBtn2(() async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  await _post.newPostMethod(usr, value, ll);
                  Navigator.pop(context);
                }
              }, 'Add', Colors.green[300], Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
