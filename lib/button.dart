import 'package:flutter/material.dart';
import 'package:flutter_app1/dialog.dart';
import 'dart:async';

import 'package:flutter_app1/dialog2.dart';

class ButtonRoute extends StatefulWidget {
  @override
  State createState() {
    return ButtonRouteState();
  }
}

class ButtonRouteState extends State<ButtonRoute> {
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> showDeleteConfirmDialog2() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> showDialog1() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗？"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消")),
              FlatButton(
                  onPressed: () {
                    // 删除文件
                    print('删除文件。。。');
                    Navigator.of(context).pop(true);
                  },
                  child: Text("确定"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("删除1"),
                  onPressed: () async {
                    print('删除1');
                    // 弹出对话框，并等待其关闭
                    bool delete = await showDeleteConfirmDialog1();
                    if (delete == null) {
                      print("取消删除");
                    } else {
                      print("已确认删除");
                    }
                  },
                ),
                MyDialogRoute(),
                DialogRoute()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
