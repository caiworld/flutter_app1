import 'package:flutter/material.dart';

class NavBarTestRoute extends StatelessWidget {
  final String title;
  final Color color; //背景颜色

  NavBarTestRoute({
    Key key,
    this.color = const Color.fromARGB(255, 78, 96, 23),
    this.title = "字体颜色与背景颜色对比",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 52,
            maxHeight: 200,
            minWidth: double.infinity,
          ),
          decoration: BoxDecoration(
            color: color,
            boxShadow: [
              //阴影
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 3),
                blurRadius: 3,
              ),
            ],
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              //根据背景色亮度来确定Title颜色
              color:
                  color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
