import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/widgets/btn.dart';
import 'package:insult/widgets/profile_wid/myCard.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              horizontal: 10,
              // vertical: 10,
            ),
            child: CustomPaint(
              painter: RPSCustomPainter(),
              child: Container(
                alignment: Alignment.center,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: MediaQuery.of(context).size.width / 3,
                          child: MyCard(
                            Icons.favorite,
                            'Favourite',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: MediaQuery.of(context).size.width / 3,
                          child: MyCard(
                            Icons.edit,
                            'edited',
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4.5,
                          width: MediaQuery.of(context).size.width / 3,
                          child: MyCard(Icons.whatshot, 'whatshot'),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 4.5,
                            width: MediaQuery.of(context).size.width / 3,
                            child: MyCard(Icons.whatshot_rounded, 'rounded')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: MyBtn(() {
            print('jslkdjf');
          }, 'Log Out'),
        )
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(size.width * 0.23, 0, size.width * 0.31, 0);
    path_0.cubicTo(size.width * 0.43, size.height * 0.15, size.width * 0.57,
        size.height * 0.15, size.width * 0.69, 0);
    path_0.quadraticBezierTo(size.width * 0.77, 0, size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.50, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
