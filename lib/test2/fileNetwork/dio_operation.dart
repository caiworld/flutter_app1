import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioTestRoute extends StatefulWidget {
  @override
  State createState() {
    return _DioTestRouteState();
  }
}

class _DioTestRouteState extends State<DioTestRoute> {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Demo"),
      ),
      body: Center(
        child: FutureBuilder(
            future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // 请求完成
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                // 请求成功，通过项目信息构建用于显示项目名称的ListView
                return ListView(
                  children: response.data
                      .map<Widget>((e) => ListTile(
                            title: Text(e["full_name"]),
                          ))
                      .toList(),
                );
              }
              // 请求未完成时弹出loading框
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
