import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/services/getData.dart';
import 'package:provider/provider.dart';

GetData _data = GetData();

class ProfileListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var user = Provider.of<User>(context);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (_, __) {
        return Padding(
          padding: EdgeInsets.only(
            top: 120,
            bottom: 100,
          ),
          child: Container(
            height: size.height / 2.5,
            decoration: BoxDecoration(
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
              color: Color(0xFF182C61),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: FutureBuilder(
              future: _data.getOnlyFromUser(user),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('insult #${__ + 1}'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${snapshot.data[__]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(child: Text('Loading........'));
                }
              },
            ),
          ),
        );
      },
      itemCount: Provider.of<Data>(context).userInsultLength,
    );
  }
}
