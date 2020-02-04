import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogTestRoute extends StatefulWidget {
  @override
  State createState() {
    return _AlertDialogTestRouteState();
  }
}

class _AlertDialogTestRouteState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                bool delete = await showDeleteDialog1();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("确认删除");
                  // 删除文件
                }
              },
              child: Text("删除文件"),
            ),
            RaisedButton(
              onPressed: () async {
                String language = await selectLanguageDialog();
                print(language);
              },
              child: Text("选择语言"),
            ),
            RaisedButton(
              onPressed: () async {
                int i = await customDialog();
                print(i);
              },
              child: Text("自定义对话框"),
            ),
            RaisedButton(
              onPressed: () async {
                bool i = await manageDialogState2();
                print(i);
              },
              child: Text("对话框状态管理"),
            ),
            RaisedButton(
              onPressed: () async {
                DateTime d = await showDateTimeDialog();
                print(d);
              },
              child: Text("日历选择器"),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteDialog1() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("你确定要删除当前文件吗？"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("取消"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("确定"),
              )
            ],
          );
        });
  }

  Future<String> selectLanguageDialog() async {
    String language = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("请选择语言"),
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                ),
                child: SimpleDialogOption(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text("中文"),
                  ),
                  onPressed: () {
                    Navigator.pop(context, "中文");
                  },
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
                child: SimpleDialogOption(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text("English"),
                  ),
                  onPressed: () {
                    Navigator.pop(context, "English");
                  },
                ),
              ),
              SimpleDialogOption(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text("Japanese"),
                ),
                onPressed: () {
                  Navigator.pop(context, "Japanese");
                },
              ),
            ],
          );
        });

    return language;
  }

  Future<int> customDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return UnconstrainedBox(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 280),
              child: Material(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("请选择"),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text("$index"),
                            onTap: () => Navigator.of(context).pop(index),
                          );
                        },
                        itemCount: 30,
                      ),
                    ),
                  ],
                ),
                type: MaterialType.card,
              ),
            ),
            constrainedAxis: Axis.vertical,
          );
        });
  }

  Future<bool> manageDialogState() {
    bool withTree = false;
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("你确定要删除当前文件吗？"),
                Row(
                  children: <Widget>[
                    Text("同时删除子目录？"),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter _setState) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool value) {
                          _setState(() {
                            withTree = !withTree;
                          });
                        },
                      );
                    }),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("取消"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                },
                child: Text("确定"),
              ),
            ],
          );
        });
  }

  Future<bool> manageDialogState2() {
    bool withTree = false;
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("你确定要删除当前文件吗？"),
                Row(
                  children: <Widget>[
                    Text("同时删除子目录？"),
                    Builder(builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool newValue) {
                          withTree = newValue;
                          (context as Element).markNeedsBuild();
                        },
                      );
                    }),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("取消"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                },
                child: Text("确定"),
              ),
            ],
          );
        });
  }

  Future<DateTime> showDateTimeDialog() {
    var now = DateTime.now();
    print(now);
    return showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(Duration(days: 30)),
    );
  }
}
