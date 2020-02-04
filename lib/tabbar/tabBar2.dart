import 'package:flutter/material.dart';
import 'package:flutter_app1/myDrawer.dart';

const TITLE = "内容";

class TabBarRoute2 extends StatelessWidget {
  TabBarRoute2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TabController'),
          backgroundColor: Colors.pink,
        ),
        body: TabControllerDemo(),
        drawer: MyDrawer(),
      ),
    );
  }
}

class TabControllerDemo extends StatefulWidget {
  TabControllerDemo({Key key}) : super(key: key);

  _TabControllerDemoState createState() => _TabControllerDemoState();
}

class _TabControllerDemoState extends State<TabControllerDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    this._tabController = new TabController(vsync: this, length: 3);
    this._tabController.addListener(() {
      print(this._tabController.toString());
      print(this._tabController.index);
      print(this._tabController.length);
      print(this._tabController.previousIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
            indicatorWeight: 2,
            controller: this._tabController,
            labelColor: Colors.pink,
            tabs: <Widget>[
              Tab(text: '女装'),
              Tab(text: '男装'),
              Tab(text: '童装'),
//              Tab(text: '夏装'),
//              Tab(text: '冬装'),
            ],
          ),
        ),
        body: TabBarView(
          controller: this._tabController,
          children: <Widget>[
            ListViewContent("女装"),
            ListViewContent("男装"),
            ListViewContent("童装"),
//            ListViewContent("夏装"),
//            ListViewContent("冬装"),
          ],
        ),

    );
  }
}

class ListViewContent extends StatelessWidget {
  String msg;

  ListViewContent(this.msg, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
        ListTile(title: Text(msg)),
      ],
    );
  }
}
