import 'dart:math';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class User {
  final String name;
  final String company;
  final bool favourite;
  User(this.name, this.company, this.favourite);
}

class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  List<User> userList = [];
  List<String> strList = [];
  List<Widget> favouriteList = [];
  List<Widget> normalList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    for (var i = 0; i < 100; i++) {
      var name = 'noll';
      userList.add(User(name, 'faker.company.name()', false));
    }
    for (var i = 0; i < 4; i++) {
      var name = 'faker.person.name()';
      userList.add(User(name, 'faker.company.name()', true));
    }
    userList
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    filterList();
    searchController.addListener(() {
      filterList();
    });
    super.initState();
  }

  filterList() {
    List<User> users = [];
    users.addAll(userList);
    favouriteList = [];
    normalList = [];
    strList = [];
    if (searchController.text.isNotEmpty) {
      users.retainWhere((user) => user.name
          .toLowerCase()
          .contains(searchController.text.toLowerCase()));
    }
    users.forEach(
      (user) {
        if (user.favourite) {
          favouriteList.add(
            Slidable(
              actionPane: SlidableDrawerActionPane(),
              // actionExtentRatio: 0.25,
              secondaryActions: <Widget>[
                IconSlideAction(
                  iconWidget: Icon(Icons.star, color: Colors.black),
                  onTap: () {},
                ),
                IconSlideAction(
                  iconWidget: Icon(Icons.edit, color: Colors.black),
                  onTap: () {},
                ),
              ],
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF5a5c6a).withOpacity(1.0),
                        Color(0xFF202d3a).withOpacity(1.0)
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text('Asshole',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          )),
                      Text(
                          'it means from where you  sdkjfslkdjfslkdjfslkdjf;lksare do pooping lol')
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          normalList.add(
            Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              secondaryActions: <Widget>[
                IconSlideAction(
                  iconWidget: Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
                IconSlideAction(
                  iconWidget: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onTap: () {},
                ),
              ],
              child: Padding(
                padding: EdgeInsets.all(8.0),
                //! I removed ListTile and added Container for using card insted of Tile xD
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                      colors: [
                        Color((Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                        Color((Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0)
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text('Asshole',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          )),
                      Text(
                          'it means from where you  sdkjfslkdjfslkdjfslkdjf;lksare do pooping lol')
                    ],
                  ),
                ),
              ),
            ),
          );
          strList.add(user.name);
        }
      },
    );

    setState(() {
      strList;
      favouriteList;
      normalList;
      strList;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentStr = "";
    return AlphabetListScrollView(
      strList: strList,
      highlightTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      showPreview: true,
      itemBuilder: (context, index) {
        return normalList[index];
      },
      indexedHeight: (i) {
        return 200;
      },
      keyboardUsage: true,
      headerWidgetList: <AlphabetScrollListHeader>[
        AlphabetScrollListHeader(widgetList: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffix: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                labelText: "Search",
              ),
            ),
          )
        ], icon: Icon(Icons.search), indexedHeaderHeight: (index) => 80),
        AlphabetScrollListHeader(
          widgetList: favouriteList,
          icon: Icon(Icons.star),
          indexedHeaderHeight: (index) {
            return 200;
          },
        ),
      ],
    );
  }
}
