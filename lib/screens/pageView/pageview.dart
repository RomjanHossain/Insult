import 'package:flutter/material.dart';
import 'package:insult/models/allProvider.dart';
import 'package:provider/provider.dart';

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
      itemBuilder: (BuildContext context, index) {
        return ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: Provider.of<Data>(context).oriented
                    ? MediaQuery.of(context).size.height * 0.8
                    : MediaQuery.of(context).size.height * 0.5,
                width: Provider.of<Data>(context).oriented
                    ? MediaQuery.of(context).size.width * 0.9
                    : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('jfkdjfsd'),
              ),
            );
          },
          itemCount: 10,
        );
      },
    );
  }
}
