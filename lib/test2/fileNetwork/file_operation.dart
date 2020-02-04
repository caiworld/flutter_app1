import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileTestRoute extends StatefulWidget {
  @override
  State createState() {
    return _FileTestRouteState();
  }
}

class _FileTestRouteState extends State<FileTestRoute> {
  int _count;

  @override
  void initState() {
    super.initState();
    // 访问文件获取点击次数
    _readCount().then((int value) {
      setState(() {
        _count = value;
      });
    });
  }

  Future<int> _readCount() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数
      String countStr = await file.readAsString();
      return int.parse(countStr);
    } on FileSystemException {
      return 0;
    }
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/count.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作：计数器"),
      ),
      body: Center(
        child: Text("$_count"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increament();
        },
        tooltip: "Increament",
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Null> _increament() async {
    setState(() {
      ++_count;
    });
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_count');
  }
}
