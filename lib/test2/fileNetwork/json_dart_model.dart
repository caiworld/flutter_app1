import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app1/models/index.dart';

class JsonDartModelTestRoute extends StatefulWidget {
  @override
  State createState() {
    return _JsonDartModelTestRouteState();
  }
}

class _JsonDartModelTestRouteState extends State<JsonDartModelTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("json转dart model测试"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Map<String, dynamic> map = new Map();
            map['name'] = "蔡浩";
            map['father'] = null;
            map['age'] = 23;
            User user = User.fromJson(map);
            print(user.toJson());
            print("------------");
            print(user.toString());
          },
          child: Text("test"),
        ),
      ),
    );
  }
}
