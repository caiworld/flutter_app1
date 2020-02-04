import 'package:flutter/material.dart';
import 'package:flutter_app1/test2/functionwidget/cartModel.dart';
import 'package:provider/provider.dart';

class CartTestRoute extends StatefulWidget {
  @override
  State createState() {
    return _CartTestRouteState();
  }
}

class _CartTestRouteState extends State<CartTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跨组件状态共享的计数器"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(builder: (context) {
              print("Text build");
              return Text("${Provider.of<CartModel>(context).totalPrice}");
            }),
            Builder(builder: (context) {
              print("FlatButton build");
              return FlatButton(
                onPressed: () {
                  // 加上listen:false之后，FlatButton就不会被重新构建了
                  Provider.of<CartModel>(context, listen: false)
                      .add(Item(20, 1));
                },
                child: Text("加购物车"),
                color: Theme.of(context).primaryColor,
              );
            }),
          ],
        ),
      ),
    );
  }
}
