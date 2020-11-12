import 'package:flutter/material.dart';
import 'package:insult/widgets/btn.dart';
import 'package:insult/widgets/profile_wid/customPaint.dart';
import 'package:insult/widgets/profile_wid/myCard.dart';
// import '../../models/api/getResultfromAPI.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Insults insult = Insults();
    return Stack(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      // alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/Profile/profile6.jpeg'),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              // vertical: 10,
            ),
            child: CustomPaint(
              painter: RPSCustomPainter(),
              child: Container(
                alignment: Alignment.center,
                height: 430,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: MyCard(
                            Icons.favorite,
                            'Favourite',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: MyCard(
                            Icons.edit,
                            'edited',
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: MyCard(Icons.whatshot, 'whatshot'),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 4.5,
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: MyCard(Icons.whatshot_rounded, 'rounded')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.4,
          left: MediaQuery.of(context).size.width / 2.6,
          child: MyBtn(() {
            print('jslkdjf');
            // String ss = await insult.getData();
            // print(ss);
          }, 'Log Out', Colors.blueGrey),
        )
      ],
    );
  }
}
