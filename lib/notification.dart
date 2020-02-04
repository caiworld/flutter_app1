import 'package:flutter/material.dart';

class NotificationRoute extends StatefulWidget {
  @override
  State createState() {
    return NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: NotificationListener(
            onNotification: (notification) {
              switch (notification.runtimeType) {
                case ScrollStartNotification:
                  print("开始滚动");
                  break;
                case ScrollUpdateNotification:
                  print("正在滚动");
                  break;
                case ScrollEndNotification:
                  print("滚动停止");
                  break;
                case OverscrollNotification:
                  print("滚到尽头");
                  break;
              }
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              },
              itemCount: 100,
            )),
      ),
    );
  }
}
