import 'dart:math';

import 'package:flutter/material.dart';

class ScaffoldRoute2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldRouteState2();
  }
}

class _ScaffoldRouteState2 extends State<ScaffoldRoute2>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 1;

  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Name"),
          actions: <Widget>[
            // 导航栏右侧菜单
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  print("share success");
                })
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
          ),
        ),
        drawer: new MyDrawer(),
        // 抽屉
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), title: Text("business")),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), title: Text("school")),
          ],
          currentIndex: _selectIndex,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          // 悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd,
        ),
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 5,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onAdd() {
    print('onAdd');
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          // 移除抽屉菜单顶部默认留白
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.asset(
                          "images/pic1.jpg",
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      "Wendux",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("add account"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("manager account"),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
