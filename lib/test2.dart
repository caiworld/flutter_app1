import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app1/test3.dart';

class Test2MyApp extends StatefulWidget {
  @override
  State createState() {
    return Test2MyAppState();
  }
}

class Test2MyAppState extends State<Test2MyApp> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey _globalKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(primaryColor: Colors.blue),
        home: new Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _globalKey,
                  autovalidate: true, // 自动校验
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        //autofocus: true,
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "用户名或昵称",
                          icon: Icon(Icons.person),
                        ),
                        validator: (v) {
                          return v.trim().length > 0 ? null : "用户名不能为空";
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "密码不得少于6位",
                          icon: Icon(Icons.lock),
                        ),
                        validator: (v) {
                          return v.trim().length > 5 ? null : "密码不得少于6位";
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text("登录"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                //在这里不能通过此方式获取FormState，context不对
                                //print(Form.of(context));

                                // 通过_formKey.currentState 获取FormState后，
                                // 调用validate()方法校验用户名密码是否合法，校验
                                // 通过后再提交数据。
                                if ((_globalKey.currentState as FormState)
                                    .validate()) {
                                  // 验证通过，提交数据
                                  print(
                                      "username:${_usernameController.text},password:${_passwordController.text}");
                                }
                              },
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation(Colors.green),
                          value: .7,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor: AlwaysStoppedAnimation(Colors.lightGreenAccent),
                          value: .7,
                          strokeWidth: 10,
                        ),
                      ),
                      ProgressRoute(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}
