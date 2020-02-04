import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';

class InfiniteListView2 extends StatefulWidget {
  @override
  _InfiniteListView2State createState() {
    return _InfiniteListView2State();
  }
}

class _InfiniteListView2State extends State<InfiniteListView2> {

  GlobalKey<_InfiniteListView2State> infiniteListViewKey = new GlobalKey<_InfiniteListView2State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("无限加载ListView"),
      ),
      body: StatefulBuilder(builder: (BuildContext ctx, StateSetter _setState) {
        return InfiniteListView<int>(
          key: infiniteListViewKey,
          onRetrieveData: (int page, List<int> items, bool refresh) async {
            // 查询新数据
            List<int> data = await getData();
            // 将新查出来的数据添加到原有集合
            items.addAll(data);
            return data.length == 60;
          },
          itemBuilder: (List<int> list, int index, BuildContext ctx) {
            // 数据列表项
            return GestureDetector(
              child: Text("${list[index]}"),
              onTap: () async {
                _setState(() {

                });
              },
            );
          },
        );
      }),
    );
  }

  Future<List<int>> getData() async {
    return Future.delayed(Duration(seconds: 2)).then((v) {
      List<int> list = new List<int>();
      for (int i = 0; i < 60; i++) {
        list.add(i);
      }
      return list;
    });
  }
}
