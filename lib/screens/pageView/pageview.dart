import 'package:flutter/material.dart';
import 'package:insult/screens/pageView/components/pageListView.dart';
import 'package:insult/services/auth.dart';

AuthServices auth = AuthServices();

class Pageview extends StatefulWidget {
  @override
  _PageviewState createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index0) {
        return PageListView(
          index0: index0,
        );
      },
    );
  }
}
