import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // 移除顶部padding
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("抽屉"),
          ],
        ),
      ),
    );
  }

//  Widget _buildHeader() {
//    return Consumer<RateEmpModel>(
//      builder: (BuildContext context, RateEmpModel value, Widget child) {
//        return GestureDetector(
//          child: Container(
//            color: Theme.of(context).primaryColor,
//            padding: EdgeInsets.only(top: 40, bottom: 20),
//            child: Row(
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                  child: ClipOval(
//                    // 如果已登录，则显示用户头像，若未登录，则显示默认头像
//                    child: value.isLogin
//                        ? GlobalWidget.gmAvatar(
//                            "http://b-ssl.duitang.com/uploads/item/201712/18/20171218110233_5iVaC.jpeg",
//                            width: 80,height: 80)
//                        : Image.asset(
//                            "imgs/code-fork.png",
//                            width: 80,height: 80
//                          ),
////                    child: GlobalWidget.gmAvatar(
////                        "https://www.baidu.com/img/bd_logo1.png",
////                        width: 80),
//                  ),
//                ),
//                Text(
//                  value.isLogin ? value.rateEmp.empName : "未登录",
//                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    color: Colors.white,
//                  ),
//                )
//              ],
//            ),
//          ),
//          onTap: () {
//            if (!value.isLogin) {
//              Navigator.of(context).pushNamed("login");
//            }
//          },
//        );
//      },
//    );
//  }

  ///  构建菜单项
//  Widget _buildMenus() {
//    return Consumer<RateEmpModel>(builder:
//        (BuildContext context, RateEmpModel rateEmpModel, Widget child) {
//      return ListView(
//        children: <Widget>[
//          if (rateEmpModel.isLogin)
//            ListTile(
//              leading: const Icon(Icons.power_settings_new),
//              title: Text("退出"),
//              onTap: () {
//                showDialog(
//                    context: context,
//                    builder: (ctx) {
//                      // 退出账号前先弹二次确认窗
//                      return AlertDialog(
//                        content: Text("确定要退出吗？"),
//                        actions: <Widget>[
//                          FlatButton(
//                            child: Text("取消"),
//                            onPressed: () => Navigator.pop(context),
//                          ),
//                          FlatButton(
//                            child: Text("确定"),
//                            onPressed: () {
//                              // 该赋值语句会触发MaterialApp rebuild
//                              rateEmpModel.rateEmp = null;
//                              Navigator.pop(context);
//                            },
//                          )
//                        ],
//                      );
//                    });
//              },
//            )
//          else
//            ListTile()
//        ],
//      );
//    });
//  }
}
