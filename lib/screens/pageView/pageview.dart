import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/services/allProvider.dart';
import 'package:provider/provider.dart';
import 'package:insult/models/api/getResultfromAPI.dart';

class Pageview extends StatefulWidget {
  @override
  _PageviewState createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  PageController _controller;
  Insults insult = Insults();
  @override
  void initState() {
    super.initState();
    _controller = PageController();
    // listOfInsults();
  }

  // 10 list of insults

  List<String> insults = [];
  Future listOfInsults() async {
    String _dd = await insult.getData();
    insults.add(_dd);
    return insults;
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
                child: FutureBuilder(
                  future: listOfInsults(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        '${snapshot.data}',
                        style: bestQuote,
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return Text('Loading...........');
                  },
                ),
              ),
            );
          },
          itemCount: 10,
        );
      },
    );
  }
}
