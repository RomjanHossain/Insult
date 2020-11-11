import 'package:flutter/material.dart';
import 'package:insult/widgets/btn.dart';
import 'package:insult/widgets/profile_wid/myCard.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/Profile/profile6.jpeg'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: MyCard(Icons.favorite, 'Favourite')),
                    Expanded(child: MyCard(Icons.edit, 'edited'))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: MyCard(Icons.whatshot, 'whatshot')),
                    Expanded(child: MyCard(Icons.whatshot_rounded, 'rounded')),
                  ],
                ),
              ],
            ),
          ),
        ),
        MyBtn(() {
          print('jslkdjf');
        }, 'Log Out')
      ],
    );
  }
}
