import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderTestRoute extends StatefulWidget {
  @override
  State createState() {
    return FutureBuilderTestRouteState();
  }
}

class FutureBuilderTestRouteState extends State<FutureBuilderTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("异步UI更新"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<String>(
              future: mockNetWorkData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // 请求已结束
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // 请求失败，显示错误
                    return Text("Error: ${snapshot.error}");
                  } else {
                    // 请求成功，显示数据
                    return Text("Data: ${snapshot.data}");
                  }
                } else {
                  // 请求未结束，显示loading
                  return CircularProgressIndicator();
                }
              },
            ),
            StreamBuilder(
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                // 请求已结束
                if (snapshot.hasError) {
                  // 请求失败，显示错误
                  return Text("Error: ${snapshot.error}");
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text("没有Stream");
                  case ConnectionState.waiting:
                    return Text("等待");
                  case ConnectionState.active:
                    return Text("active: ${snapshot.data}");
                  case ConnectionState.done:
                    return Text("Stream已关闭");
                }
                return null;
              },
              stream: mockStreamData(),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("获取数据"),
            )
          ],
        ),
      ),
    );
  }

  Future<String> mockNetWorkData() {
    return Future.delayed(Duration(seconds: 3), () => "我是从互联网获取的数据");
  }

  Stream<int> mockStreamData() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }
}
