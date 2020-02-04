import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BothDirectionTestRoute extends StatefulWidget {
  @override
  State createState() {
    return BoseDirectionTestRouteState();
  }
}

class BoseDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              child: GestureDetector(
                child: CircleAvatar(child: Text("A")),
                // 垂直方向拖动事件
                onVerticalDragUpdate: (details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
              ),
              top: _top,
              left: _left,
            )
          ],
        ),
      ),
    );
  }
}
