import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewRoute extends StatefulWidget {
  @override
  State createState() {
    return _ListViewRouteState();
  }
}

class _ListViewRouteState extends State<ListViewRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("ListView"),
          ),
          body: getListViewBuilderAndTitle()),
    );
  }

  DateTime _lastPressedAt; //上次点击时间
  Widget getListViewBuilderAndTitle() {
    return Column(
      children: <Widget>[
//        ListTile(
//          title: Text("商品列表"),
//        ),
        Container(
          child: ListTile(
            title: Text("商品列表"),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          ),
          color: Colors.red,
        ),
        Expanded(
          child: getListViewBuilder(),
        ),
        new WillPopScope(
            onWillPop: () async {
              if (_lastPressedAt == null ||
                  DateTime.now().difference(_lastPressedAt) >
                      Duration(seconds: 1)) {
                //两次点击间隔超过1秒则重新计时
                _lastPressedAt = DateTime.now();
                return false;
              }
              return true;
            },
            child: Container(
              height: 0,
              alignment: Alignment.center,
              child: Text("1秒内连续按两次返回键退出"),
            ))
      ],
    );
  }

  Widget getListViewBuilder() {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 50.0, // 强制高度为50
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
          );
        });
  }

  Widget getListViewSeperator() {
    // 下划线widget预定义以供复用
    Widget divider1 = Divider(
      color: Colors.red,
    );
    Widget divider2 = Divider(
      color: Colors.blue,
    );
    return ListView.separated(
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
          );
        });
  }
}

class _ListViewRouteState2 extends State<ListViewRoute> {
  static const loadingTag = "##loading##"; // 表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("无限延时加载滑动"),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              // 如果到了表尾
              if (_words[index] == loadingTag) {
                // 不足100条，继续获取数据
                if (_words.length - 1 < 100) {
                  // 获取数据
                  _retrieveData();
                  // 加载时显示loading
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0),
                    ),
                  );
                } else {
                  // 已经加载了100条数据
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              }
              // 显示单词列表项
              return ListTile(
                title: Text(_words[index]),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  height: .0,
                ),
            itemCount: _words.length),
      ),
    );
  }

  _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        // 重新构建列表
      });
    });
  }
}

//class _InfiniteListViewState extends State<ListViewRoute> {
//  static const loadingTag = "##loading##"; //表尾标记
//  var _words = <String>[loadingTag];
//
//  @override
//  void initState() {
//    super.initState();
//    _retrieveData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView.separated(
//      itemCount: _words.length,
//      itemBuilder: (context, index) {
//        //如果到了表尾
//        if (_words[index] == loadingTag) {
//          //不足100条，继续获取数据
//          if (_words.length - 1 < 100) {
//            //获取数据
//            _retrieveData();
//            //加载时显示loading
//            return Container(
//              padding: const EdgeInsets.all(16.0),
//              alignment: Alignment.center,
//              child: SizedBox(
//                  width: 24.0,
//                  height: 24.0,
//                  child: CircularProgressIndicator(strokeWidth: 2.0)
//              ),
//            );
//          } else {
//            //已经加载了100条数据，不再获取数据。
//            return Container(
//                alignment: Alignment.center,
//                padding: EdgeInsets.all(16.0),
//                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
//            );
//          }
//        }
//        //显示单词列表项
//        return ListTile(title: Text(_words[index]));
//      },
//      separatorBuilder: (context, index) => Divider(height: .0),
//    );
//  }
//
//  void _retrieveData() {
//    setState(() {
//
//    });
////    Future.delayed(Duration(seconds: 2)).then((e) {
////      _words.insertAll(_words.length - 1,
////          //每次生成20个单词
////          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
////      );
////      setState(() {
////        //重新构建列表
////      });
////    });
//  }
//
//}
