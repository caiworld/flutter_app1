import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarRoute extends StatefulWidget {
  @override
  State createState() {
    return _BottomNavigationBarRouteState();
  }
}

class _BottomNavigationBarRouteState extends State<BottomNavigationBarRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //导航栏
          title: Text("App Name"),
          actions: <Widget>[
            //导航栏右侧菜单
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
          ],
        ),
//      drawer: new MyDrawer(), //抽屉
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeIcon: Icon(Icons.add)),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), title: Text('Business')),
            BottomNavigationBarItem(
                icon: Icon(Icons.school), title: Text('School')),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
            //悬浮按钮
            child: Icon(Icons.add),
            onPressed: _onAdd),
        body: _pages.elementAt(_selectedIndex),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}

  List<Widget> _pages = <Widget>[
    Page1(),
    Page2(),
    Page3(),
  ];

  Widget page1() {
    return Center(child: Text("Index 0 Home"));
  }

  Widget page2() {
    return Center(child: Text("Index 0 Home"));
  }

  Widget page3() {
    return Center(child: Text("Index 0 Home"));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Index 0 Home"));
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Index 1 Business"));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Index 2 Hospital"));
  }
}
