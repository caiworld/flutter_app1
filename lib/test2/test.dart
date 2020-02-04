import 'package:flutter/material.dart';

class TestRoute extends StatefulWidget {
  @override
  State createState() {
    return TestRouteState();
  }
}

class TestRouteState extends State<TestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("ScrollControllerTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("scrollControllerTest");
                  },
                ),
                RaisedButton(
                  child: Text("WillPopScopeTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("willPopScopeTest");
                  },
                ),
                RaisedButton(
                  child: Text("CartTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("cartTest");
                  },
                ),
                RaisedButton(
                  child: Text("NavBarTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("navBarTest");
                  },
                ),
                RaisedButton(
                  child: Text("ThemeTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("themeTest");
                  },
                ),
                RaisedButton(
                  child: Text("FutureBuilderTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("futureBuilderTest");
                  },
                ),
                RaisedButton(
                  child: Text("AlertDialogTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("alertDialogTest");
                  },
                ),
                RaisedButton(
                  child: Text("PointEventListenerTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("pointEventListenerTest");
                  },
                ),
                RaisedButton(
                  child: Text("GestureRecognizerTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("gestureRecognizerTest");
                  },
                ),
                RaisedButton(
                  child: Text("NotificationTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("notificationTest");
                  },
                ),
                RaisedButton(
                  child: Text("FileTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("fileTest");
                  },
                ),
                RaisedButton(
                  child: Text("DioTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("dioTest");
                  },
                ),
                RaisedButton(
                  child: Text("WebSocketRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("webSocket");
                  },
                ),
                RaisedButton(
                  child: Text("JsonDartModelTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("jsonDartModelTest");
                  },
                ),
                RaisedButton(
                  child: Text("EncryptDecryptTestRoute"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("encryptDecryptTest");
                  },
                ),
                RaisedButton(
                  child: Text("infiniteListView"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("infiniteListView");
                  },
                ),
                RaisedButton(
                  child: Text("infiniteListView2"),
                  onPressed: () {
                    Navigator.of(context).pushNamed("infiniteListView2");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
