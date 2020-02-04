import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/audit/auditWidget.dart';
import 'package:flutter_app1/i10n/localization_intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TabBarRoute3 extends StatefulWidget {
  @override
  State createState() {
    return _TabBarRoute3State();
  }
}

class _TabBarRoute3State extends State<TabBarRoute3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
//        DemoLocalizationsDelegate.delegate,
        DemoLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
        // 其他locales
      ],
      onGenerateTitle: (context) {
        return DemoLocalizations.of(context).title;
      },
      home: MyHomePage(),
    );
  }

  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("abf"),
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
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.index = 1;
    _tabController.addListener(() {
      print(_tabController.length);
      print(_tabController.index);
      print(_tabController.previousIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
        bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: DemoLocalizations.of(context).tabName1,
              ),
              Tab(
                text: DemoLocalizations.of(context).title,
              ),
              Tab(
                text: "c",
              ),
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text("A"),
          Text("B"),
          RaisedButton(
            child:
                Text(DemoLocalizations.of(context).remainingEmailsMessage(42)),
            color: Colors.green,
            onPressed: () {
              print(Localizations.localeOf(context).languageCode);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Text("drawer"),
      ),
    );
  }
}
