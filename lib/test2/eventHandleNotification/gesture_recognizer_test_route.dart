import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerTestRoute extends StatefulWidget {
  @override
  State createState() {
    return _GestureRecognizerTestRouteState();
  }
}

class _GestureRecognizerTestRouteState
    extends State<GestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  @override
  void initState() {
//    _tapGestureRecognizer.onTap = () {
//      setState(() {
//        _toggle = !_toggle;
//      });
//    };
    super.initState();
  } //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "你好世界"),
        TextSpan(
          text: "点我变色",
          style: TextStyle(
              fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
          recognizer: _tapGestureRecognizer
            ..onTap = () {
              setState(() {
                _toggle = !_toggle;
              });
            },
        ),
        TextSpan(text: "你好世界"),
      ])),
    );
  }
}

class EventBus {
  EventBus._internal();

  var i = 1;
}

class Abc {
  EventBus bus = new EventBus._internal();

  Abc() {
    bus.i = 1;
  }
}
