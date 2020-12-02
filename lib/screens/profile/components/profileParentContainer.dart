import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/screens/profile/components/profileCenterContainer.dart';
import 'package:insult/screens/profile/components/profileListView.dart';
import 'package:insult/services/allProvider.dart';
import 'package:provider/provider.dart';

class ProfileParentContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: size.height / 1.5,
      decoration: BoxDecoration(
        color: testColor,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.white.withOpacity(.4),
            offset: Offset(-4, -4),
            spreadRadius: 2,
          ),
          BoxShadow(
            blurRadius: 10,
            color: Colors.black,
            offset: Offset(4, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: (Provider.of<Data>(context).userInsultLength == 0)
          ? Padding(
              padding: EdgeInsets.only(
                top: 120,
                bottom: 100,
              ),
              child: ProfileCenterContainer(),
            )
          : ProfileListView(),
    );
  }
}
