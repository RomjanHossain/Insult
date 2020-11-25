import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:insult/const.dart';

class BottomBar extends StatefulWidget {
  BottomBar({this.onp, this.sInd});
  final Function onp;
  final int sInd;
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: primaryColor, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            color: Colors.black,
            iconSize: 25,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            duration: Duration(milliseconds: 800),
            tabBackgroundColor: navBgColor,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconColor: navIconInactive,
              ),
              GButton(
                icon: Icons.view_column,
                text: 'Page',
                iconColor: navIconInactive,
              ),
              GButton(
                icon: Icons.view_headline,
                text: 'words',
                iconColor: navIconInactive,
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                iconColor: navIconInactive,
              ),
            ],
            selectedIndex: widget.sInd,
            onTabChange: widget.onp,
          ),
        ),
      ),
    );
  }
}
