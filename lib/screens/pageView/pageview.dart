import 'package:flutter/material.dart';
import 'package:insult/const.dart';
import 'package:insult/services/allProvider.dart';
import 'package:insult/services/auth.dart';
import 'package:insult/services/getData.dart';
import 'package:provider/provider.dart';

AuthServices auth = AuthServices();
GetData _data = GetData();

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

  getfromCloudFirestore() async {
    dynamic data = await _data.getAllInsult();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index0) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index1) {
            return Container(
              margin: EdgeInsets.all(15),
              height: Provider.of<Data>(context).oriented
                  ? MediaQuery.of(context).size.height * 0.76
                  : MediaQuery.of(context).size.height * 0.5,
              width: Provider.of<Data>(context).oriented
                  ? MediaQuery.of(context).size.width * 0.9
                  : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: testColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(.4),
                    blurRadius: 15,
                    offset: Offset(-4, -4),
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15,
                    offset: Offset(4, 4),
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: FutureBuilder<dynamic>(
                future: getfromCloudFirestore(),
                builder: (context, snapshot) {
                  // print('$index0 , $index1');
                  String _ = index0.toString() + index1.toString();
                  int _i = int.parse(_);
                  if (snapshot.hasData) {
                    // print(snapshot.data[1]);
                    return Center(
                      child: Text(
                        '${snapshot.data[_i]}',
                        style: bestQuote,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(
                    child: Text(
                      'Loading...........',
                      style: loading,
                    ),
                  );
                },
              ),
              // child: getfromCloudFirestore(),
            );
          },
          itemCount: 10,
        );
      },
    );
  }
}
