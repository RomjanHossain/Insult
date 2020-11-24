import 'package:flutter/material.dart';
import 'package:insult/services/auth.dart';
import 'package:insult/services/postData.dart';
import 'package:insult/widgets/btn.dart';

AuthServices _auth = AuthServices();
PostData _post = PostData();

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet({this.ll});
  final int ll;
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
              onChanged: (val) async {
                value = val;
                //! post data
              },
            ),
            SizedBox(
              height: 10,
            ),
            MyBtn(
              () async {
                // print(value);

                // for (String ins in _fromSite) {
                //   var usr = await _auth.getUser();
                //   await _post.newPostMethod(usr, ins, _newLL);
                //   _newLL += 1;
                //   print(ins);
                //   print(_newLL);
                // }
                // print(_fromSite.length);

                // _fromSite.forEach((element) {
                //   print(element);
                // });

                var usr = await _auth.getUser();
                await _post.newPostMethod(usr, value, ll);
                Navigator.pop(context);
              },
              'Add',
              Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
