import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TITLE = "标题";
const SUB_TITLE = "二级标题";
const IMAGE_SRC =
    'http://cms-bucket.ws.126.net/2019/06/20/68fa7f186ffe4479ab27efabd4d94246.png';

class TabBarRoute extends StatelessWidget {
  TabBarRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("自定义AppBar"),
          centerTitle: true,
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              print("home app bar");
            },
          ),
          actions: <Widget>[
            Center(
              child: Text("所有订单"),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                print("所有订单");
              },
            ),
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.pink,
                child: TabBar(
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.white,
                  indicatorWeight: 1,
                  isScrollable: true,
//                  labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  labelStyle: TextStyle(fontSize: 14.0),
                  tabs: <Widget>[
                    Tab(
                      text: "tab1",
                    ),
                    Tab(
                      text: "tab2",
                    ),
                    Tab(
                      text: "tab3",
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: <Widget>[
                    ListViewContent(),
                    ListViewContent(),
                    ListViewContent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(TITLE),
        ),
        ListTile(
          title: Text(TITLE),
        ),
        ListTile(
          title: Text(TITLE),
        ),
      ],
    );
  }
}
