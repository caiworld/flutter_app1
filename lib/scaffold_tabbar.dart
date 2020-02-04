import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldRouteState();
  }
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectIndex = 1;

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
        ),
//      drawer: new MyDrawer(), // 抽屉
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
