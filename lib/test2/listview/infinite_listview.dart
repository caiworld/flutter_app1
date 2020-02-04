import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/test2/listview/refresh_model.dart';
import 'package:provider/provider.dart';

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  int i = 1;

  @override
  Widget build(BuildContext context) {
    bool shouldRefresh = Provider.of<RefreshModel>(context).refresh;
    if (shouldRefresh && i == 1) {
      i = 2;
      setState(() {
        _words.clear();
      });
      (context as Element).markNeedsBuild();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("无限加载ListView"),
      ),
      body: ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          //如果到了表尾
          if (index == _words.length - 1) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 40) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ));
            }
          }
          //显示单词列表项
          return ListTile(
            title: Text(_words[index]),
            onTap: () {
              Navigator.of(context).pushNamed("customScrollViewTest");
            },
          );
        },
        separatorBuilder: (context, index) => Divider(height: .0),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}
