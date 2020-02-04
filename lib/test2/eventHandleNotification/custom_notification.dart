import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}

class NotificationTestRoute extends StatefulWidget {
  @override
  State createState() {
    return _NotificationTestRouteState();
  }
}

class _NotificationTestRouteState extends State<NotificationTestRoute> {
  String _msg;

  @override
  Widget build(BuildContext context) {
    // 监听通知
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义通知"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg = "$_msg + " + notification.msg;
          });
          return true;
        },
        child: Center(
          child: Column(
            children: <Widget>[
              Builder(builder: (context) {
                return RaisedButton(
                  onPressed: () {
                    // 点击按钮时分发通知
                    MyNotification("hello").dispatch(context);
                  },
                  child: Text("发送通知"),
                );
              }),
              Text(
                _msg ??= "origin",
                style: TextStyle(backgroundColor: Colors.blue),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              NotificationListener<MyNotification>(
                onNotification: (notification) {
                  print("通知没有被拦截");
                  return true;
                },
                child: NotificationListener<MyNotification>(
                  onNotification: (notification) {
                    print("拦截通知${notification.msg}");
                    return false;
                  },
                  child: Center(
                    child: Builder(builder: (context) {
                      return RaisedButton(
                        onPressed: () {
                          MyNotification("world").dispatch(context);
                        },
                        child: Text("发送通知并拦截"),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
