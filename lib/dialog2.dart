import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MyDialogRoute extends StatefulWidget{

  @override
  State createState() {
    return MyDialogRouteState();
  }
}

class MyDialogRouteState extends State<MyDialogRoute>{

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: () async{
      bool deleted = await showMyDialog();
      print("$deleted");
    },child: Text("弹窗1"),);
  }

  Future<bool> showMyDialog(){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("删除提示"),
        content: Text("确定要删除吗？"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(), // 关闭对话框
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    });
  }
}