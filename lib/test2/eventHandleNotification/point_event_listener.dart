import 'package:flutter/material.dart';

class PointEventListenerTestRoute extends StatefulWidget {
  @override
  State createState() {
    return _PointEventListenerTestRouteState();
  }
}

class _PointEventListenerTestRouteState
    extends State<PointEventListenerTestRoute> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原始指针事件处理"),
      ),
      body: Column(
        children: <Widget>[
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300.0,
              height: 150.0,
              child: Text(
                _event?.localPosition.toString() ?? "",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPointerDown: (PointerEvent event) =>
                setState(() => _event = event),
            onPointerMove: (PointerEvent event) {
              setState(() {
                _event = event;
              });
            },
            onPointerUp: (PointerEvent event) {
              print("up");
              setState(() {
                _event = event;
              });
            },
            behavior: HitTestBehavior.deferToChild,
          ),
//          Listener(
//            child: ConstrainedBox(
//              constraints: BoxConstraints.tight(Size(300.0, 150.0)),
//              child: Center(child: Text("Box A")),
//            ),
////            behavior: HitTestBehavior.opaque,
//            onPointerDown: (event) => print("down A"),
//          ),
//          Listener(
//            child: Container(
//              width: 300,
//              height: 150,
//              color: Colors.lightGreenAccent,
//              child: Text("abcdfda"),
//            ),
//            onPointerDown: (event) => print("down abcdfda"),
//          ),
          Stack(
            children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue)),
                ),
                onPointerDown: (event) => print("down0"),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                  child: Center(
                      child: Text(
                    "左上角200*100范围内非文本区域点击",
                    style: TextStyle(backgroundColor: Colors.red),
                  )),
                ),
                onPointerDown: (event) => print("down1"),
//                behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
              )
            ],
          ),
          Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event)=>print("in"),
              ),
            ),
            onPointerDown: (event)=>print("up"),
          )
        ],
      ),
    );
  }
}
