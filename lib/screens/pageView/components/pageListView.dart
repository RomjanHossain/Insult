import 'package:insult/services/getData.dart';
import 'package:insult/widgets/copyText.dart';
import 'package:provider/provider.dart';
import 'package:insult/services/allProvider.dart';
import 'package:flutter/material.dart';
import 'package:insult/const.dart';

GetData _data = GetData();

class PageListView extends StatelessWidget {
  PageListView({this.index0});
  final int index0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getfromCloudFirestore() async {
      dynamic data = await _data.getAllInsult();
      return data;
    }

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index1) {
        return Container(
          margin: EdgeInsets.all(15),
          height: Provider.of<Data>(context).oriented
              ? size.height * 0.76
              : size.height * 0.5,
          width: Provider.of<Data>(context).oriented
              ? size.width * 0.9
              : size.width,
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
              String _ = index0.toString() + index1.toString();
              int _i = int.parse(_);
              if (snapshot.hasData) {
                return Stack(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${snapshot.data[_i]}',
                      style: bestQuote.copyWith(
                        fontSize: Provider.of<Data>(context).oriented ? 50 : 35,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CopyText(
                      txt: "${snapshot.data[_i]}",
                    ),
                  )
                ]);
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
  }
}
