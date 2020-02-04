import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointEventRoute extends StatefulWidget{

  @override
  State createState() {
    return PointEventRouteState();
  }
}

class PointEventRouteState extends State<PointEventRoute>{



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
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
                child: Center(child: Text("左上角200*100范围内非文本区域点击")),
              ),
              onPointerDown: (event) => print("down1"),
//              behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
            )
          ],
        )
      )
    );
  }
}