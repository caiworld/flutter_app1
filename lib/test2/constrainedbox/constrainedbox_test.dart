import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ConstrainedBoxTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ConstrainedBox",
      home: Scaffold(
        appBar: AppBar(
          title: Text("尺寸限制类容器"),
          actions: <Widget>[
            UnconstrainedBox(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: translateRotate(),
        ),
      ),
    );
  }

  Widget rotateTranslate() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        angle: math.pi / 2,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.green),
          child: Transform.translate(
            offset: Offset(50, 50),
            child: Text("hello world"),
          ),
        ),
      ),
    );
  }

  Widget translateRotate() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.translate(
        offset: Offset(50, 50),
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Text("hello world"),
        ),
      ),
    );
  }
}
