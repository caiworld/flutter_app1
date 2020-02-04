import 'package:flutter/material.dart';

class TestMyApp extends StatefulWidget{

  @override
  TestMyAppState createState() {
    return new TestMyAppState();
  }
}

class TestMyAppState extends State<TestMyApp> {
  String _username;// 用户名
  _setUserName(String username){
    setState(() {
      print('username:$username');
      _username = username;
      print('_username:$_username');
    });
  }
  // 2.通过Controller获取输入框内容
  // 2.1 定义Controller
  TextEditingController _controller = TextEditingController();

  _getPwd(){
    print(_controller.text);
  }

@override
  void initState() {
    super.initState();
    // 监听输入改变
    _controller.addListener((){
      print(_controller.text);
    });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          // 设置主题颜色
          primaryColor: Colors.blue),
      home: new Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  onChanged: (username){
                    _setUserName(username);
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person)),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "密码不少于6位",
                      prefixIcon: Icon(Icons.lock)),
                  // 是否隐藏正在编辑的文本，即密码会用小圆点来显示
                  obscureText: true,
                  // 2.2 给输入框设置Controller
                  controller: _controller,
                ),
                RaisedButton(
                  child: Text("获取密码"),
                  onPressed: (){
                    print('password:'+_controller.text);
                  },
                )
              ],
            ),
      )),
    );
  }
}
