import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamBuilderRoute extends StatefulWidget {
  @override
  State createState() {
    return StreamBuilderRouteState();
  }
}

class StreamBuilderRouteState extends State<StreamBuilderRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error:${snapshot.error}");
              }
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text("没有Stream");
                case ConnectionState.active:
                  return Text("active: ${snapshot.data}");
                case ConnectionState.done:
                  return Text("已完成");
                case ConnectionState.waiting:
                  return Text("等待数据");
              }
              return null;
            },
            stream: Stream.periodic(Duration(seconds: 100), (i) {
              return "hello" + i.toString();
            })),
      ),
    ));
  }
}
