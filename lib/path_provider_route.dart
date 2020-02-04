import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class PathProviderRoute extends StatefulWidget {
  @override
  State createState() {
    return _FutureBuilderRouteState();
  }
}

class PathProviderRouteState extends State<PathProviderRoute> {
  int _count;

  @override
  void initState() {
    super.initState();
    // 从文件读取点击次数
    _readCount().then((int value) {
      setState(() {
        _count = value;
      });
    });
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File("$dir/count.txt");
  }

  Future<int> _readCount() async {
    try {
      // 获取文件
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String countStr = await file.readAsString();
      return int.parse(countStr);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCount() async {
    setState(() {
      _count++;
    });
    // 将点击次数以字符串类型写到文件中
    try {
      await (await _getLocalFile()).writeAsString('$_count');
    } catch (e) {
      print("出错了");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("文件操作"),
        ),
        body: Center(
          child: Text("$_count"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCount,
          tooltip: "Increment",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _FutureBuilderRouteState extends State<PathProviderRoute> {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    print("aa");
    return MaterialApp(
      home: Scaffold(
        body: new Container(
          alignment: Alignment.center,
          child: FutureBuilder(
              future: _dio.get("https://api.github.com/orgs/spring/repos"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //请求完成
                if (snapshot.connectionState == ConnectionState.done) {
                  Response response = snapshot.data;
                  //发生错误
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  //请求成功，通过项目信息构建用于显示项目名称的ListView
                  return ListView(
                    children: response.data.map<Widget>((e) =>
                        ListTile(title: Text(e["full_name"]))
                    ).toList(),
                  );
                }
                //请求未完成时弹出loading
                return CircularProgressIndicator();
              }
          ),
        ),
      ),
    );
  }
}